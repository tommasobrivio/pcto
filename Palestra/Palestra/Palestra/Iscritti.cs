using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Palestra
{
    public partial class Iscritti : Form
    {

        DataTable dataTable;
        SqlConnection conn;
        Utilities utilities;
        public Iscritti(SqlConnection c, Utilities u)
        {
            InitializeComponent();
            utilities = u;
            conn = c;
            dataTable = new DataTable() ;
            String query = "SELECT * FROM Iscritti";
            SqlCommand cmd = new SqlCommand(query, conn);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            dataTable.Load(dr);
            

            gridIscritti.DataSource = dataTable;
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

        private void cxtModifica_Click(object sender, EventArgs e)
        {
            int indice=0;
            if (gridIscritti.SelectedRows.Count > 1)
            {
                MessageBox.Show("Non puoi selezionare più di un iscritto", "Errore");
            }
            else
            {
                indice = Int32.Parse(gridIscritti.SelectedRows[0].Cells[0].Value.ToString());
            }
            
            addEditIscritto ae = new addEditIscritto("edit",indice, conn, utilities);
            this.Hide();
            ae.Show();
        }

        private void cxtElimina_Click(object sender, EventArgs e)
        {

        }

        private void btnAggiungi_Click(object sender, EventArgs e)
        {
            addEditIscritto ae = new addEditIscritto("add", conn, utilities);
            this.Hide();
            ae.Show();
        }
    }
}
