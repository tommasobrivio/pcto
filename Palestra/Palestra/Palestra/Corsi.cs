using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Palestra
{
    public partial class Corsi : Form
    {
        DataTable dataTable;
        SqlConnection conn;
        Utilities utilities;
        int indice;
        public Corsi(SqlConnection c, Utilities u)
        {
            InitializeComponent();
            dataTable = new DataTable();
            conn = c;
            utilities = u;
            btnSalva.Visible = false;

            gridCorsi.DataSource = utilities.GetAll("Corsi");
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            this.Hide();
            login.Show();
        }

        private void lblHome_Click(object sender, EventArgs e)
        {
            HomeAdmin home = new HomeAdmin(conn, utilities);
            this.Close();
            home.Show();
        }

        private void lblIscritti_Click(object sender, EventArgs e)
        {
            Iscritti iscritti = new Iscritti(conn, utilities);
            this.Close();
            iscritti.Show();
        }

        private void lblCorsi_Click(object sender, EventArgs e)
        {
            Corsi corsi = new Corsi(conn, utilities);
            this.Close();
            corsi.Show();
        }

        private void lblIscrizioni_Click(object sender, EventArgs e)
        {
            Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
            this.Close();
            iscrizioni.Show();
        }

        private void lblVisualizza_Click(object sender, EventArgs e)
        {
            Visualizza visualizza = new Visualizza(conn, utilities);
            this.Close();
            visualizza.Show();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
          
            try
            {
                if(txtAdd.Text.Trim()=="" || txtAdd.Text.Length > 20)
                {
                    MessageBox.Show("Ci sono dei campi che sono obbligatori che sono vuoti, o hanno superato l lunghezza massima", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    Corsi c = new Corsi(conn, utilities);
                    this.Close();
                    c.Show();
                }

                else
                {
                    int cont = utilities.GetContatore("Corsi");
                    String query = "INSERT INTO Corsi (IdCorso, NomeCorso) VALUES (@IdCorso, @NomeCorso)";
                    SqlCommand comm = new SqlCommand(query, conn);

                    comm.Parameters.AddWithValue("@IdCorso", cont);
                    comm.Parameters.AddWithValue("@NomeCorso", txtAdd.Text);

                    comm.ExecuteNonQuery();

                    utilities.SetContatore("Corsi", cont);

                    Corsi corsi = new Corsi(conn, utilities);
                    this.Close();
                    corsi.Show();
                }
            }
            catch
            {
                Exception exception = new Exception();
                MessageBox.Show("Qualcosa è andato storto", "Errore");
            }
            
        }

        private void txtAdd_TextChanged(object sender, EventArgs e)
        {
            if (txtAdd.Text == "")
            {
                txtAdd.BackColor = Color.FromArgb(255, 128, 128);
            }
            else
                txtAdd.BackColor = Color.White;
        }

        private void btnModifica_Click(object sender, EventArgs e)
        {
            btnSalva.Visible = true;
            btnModifica.Visible = false;
            btnAdd.Visible = false;
            try
            {

                if (gridCorsi.SelectedRows.Count > 1)
                {
                    MessageBox.Show("Non puoi selezionare più di un corso", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    Corsi c = new Corsi(conn, utilities);
                    this.Close();
                    c.Show();
                }
                else if (gridCorsi.SelectedRows.Count == 0)
                {
                    MessageBox.Show("Non hai selezionato alcun corso", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    Corsi c = new Corsi(conn, utilities);
                    this.Close();
                    c.Show();
                }
                else
                {
                    indice = Int32.Parse(gridCorsi.SelectedRows[0].Cells[0].Value.ToString());
                }
                String[] split = utilities.GetRecord("Corsi", indice, "IdCorso=").Split(';');

                txtAdd.Text = split[1];
            }
            catch
            {
                Exception exception = new Exception();
                MessageBox.Show("Qualcosa è andato storto", "Errore");
            }

        }

        private void btnSalva_Click(object sender, EventArgs e)
        {
            

            try
            {
                if (txtAdd.Text.Trim() == "" || txtAdd.Text.Length > 20)
                {
                    MessageBox.Show("Ci sono dei campi che sono obbligatori che sono vuoti, o hanno superato l lunghezza massima", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    Corsi c = new Corsi(conn, utilities);
                    this.Close();
                    c.Show();
                }

                else
                {

                    String query = "UPDATE Corsi SET NomeCorso=@NomeCorso WHERE IdCorso=@IdCorso";
                    SqlCommand comm = new SqlCommand(query, conn);

                    comm.Parameters.AddWithValue("@IdCorso", indice);
                    comm.Parameters.AddWithValue("@NomeCorso", txtAdd.Text);

                    comm.ExecuteNonQuery();


                    Corsi corsi = new Corsi(conn, utilities);
                    this.Close();
                    corsi.Show();
                }
            }
            catch
            {
                Exception exception = new Exception();
                MessageBox.Show("Qualcosa è andato storto", "Errore");
            }
        }

        private void btnElimina_Click(object sender, EventArgs e)
        {
            int indice = 0;
            if (gridCorsi.SelectedRows.Count > 1)
            {
                MessageBox.Show("Non puoi selezionare più di un iscritto", "Errore");
            }
            else if (gridCorsi.SelectedRows.Count == 0)
            {
                MessageBox.Show("Non hai scelto un corso", "Errore");
            }
            else
            {
                indice = Int32.Parse(gridCorsi.SelectedRows[0].Cells[0].Value.ToString());
            }

            String ris = utilities.GetRecord("Iscrizioni", indice, "IdCorso=");

            if (ris == "")
            {

                utilities.Delete("Corsi", indice, "IdCorso=");
                MessageBox.Show("Il corso non ha alcun iscritto. Eliminato", "Avviso");
                this.Controls.Clear();
                this.InitializeComponent();
                Corsi c = new Corsi(conn, utilities);
                this.Close();
                c.Show();
            }

            else
            {
                MessageBox.Show("Il corso ha degli iscritti, non puoi eliminarlo", "Avviso");
            }
        }
    }
}
