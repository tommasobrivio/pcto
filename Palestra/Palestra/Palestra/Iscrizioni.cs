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
    public partial class Iscrizioni : Form
    {
        DataTable dataTable;
        SqlConnection conn;
        Utilities utilities;
        List<String[]> flag;
        public Iscrizioni(SqlConnection c, Utilities u)
        {
            InitializeComponent();
            conn = c;
            utilities = u;

            dataTable=utilities.GetAll("Iscritti");

            foreach(DataRow r in dataTable.Rows)
            {
                cbIscritti.Items.Add(r.ItemArray[0].ToString()+"-"+r.ItemArray[1].ToString() + " " + r.ItemArray[2].ToString());
            }

            dataTable = utilities.GetAll("Corsi");

            foreach (DataRow r in dataTable.Rows)
            {
                checkCorsi.Items.Add(r.ItemArray[0].ToString() + "-" + r.ItemArray[1].ToString());
            }

            dataTable = utilities.GetAll("Iscrizioni");
            gridIscrizione.DataSource = dataTable;
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

        private void cbscritti_SelectedIndexChanged(object sender, EventArgs e)
        {
            for(int i = 0; i < checkCorsi.Items.Count; i++)
            {
                checkCorsi.SetItemCheckState(i, CheckState.Unchecked);
            }

            int iscritto = Int32.Parse(cbIscritti.SelectedItem.ToString().Split('-')[0]);

            

            String iscrizioni=utilities.GetRecord("Iscrizioni", iscritto, "IdIscritto=");

            String[] split = iscrizioni.Split(';');


            List<String[]> ris = new List<String[]>();
            for (int i=0; i < split.Length -1; i+=3)
            {
                ris.Add(utilities.GetRecord("Corsi", Int32.Parse(split[i + 2]), "IdCorso=").Split(';'));
            }

            for(int i = 0; i < checkCorsi.Items.Count; i++)
            {
                for(int k = 0; k < ris.Count; k++)
                {
                    if (checkCorsi.Items[i].ToString() == ""+ris[k][0]+"-"+ris[k][1])
                    {
                        checkCorsi.SetItemCheckState(i, CheckState.Checked);
                        break;
                    }
                }
                
            }
            flag = ris;
        }

        private void btnIscrivi_Click(object sender, EventArgs e)
        {
            List<String> corsi= new List<String>();
            for (int i = 0; i < checkCorsi.Items.Count; i++)
            {
                if (checkCorsi.GetItemChecked(i))
                {
                    corsi.Add(checkCorsi.Items[i].ToString());
                }
            }

            if (corsi.Count > 3)
            {
                MessageBox.Show("Non si può iscrivere un iscritto a più di 3 corsi", "Errore");
                this.Controls.Clear();
                this.InitializeComponent();
                Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
                this.Close();
                iscrizioni.Show();
            }
            else if (cbIscritti.SelectedItem == null)
            {
                MessageBox.Show("Non hai selezionato alcun iscritto", "Errore");
                this.Controls.Clear();
                this.InitializeComponent();
                Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
                this.Close();
                iscrizioni.Show();
            }
            else if(corsi.Count == 0)
            {
                int iscritto = Int32.Parse(cbIscritti.SelectedItem.ToString().Split('-')[0]);
                utilities.Delete("Iscrizioni", iscritto, "IdIscritto=");
                this.Controls.Clear();
                this.InitializeComponent();
                Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
                this.Close();
                iscrizioni.Show();
            }

            else
            {
                List<int> idCorsi = new List<int>();
                int iscritto = Int32.Parse(cbIscritti.SelectedItem.ToString().Split('-')[0]);

                for (int i = 0; i < corsi.Count; i++)
                {
                    idCorsi.Add(Int32.Parse(corsi[i].Split('-')[0]));
                }

                iscritto = Int32.Parse(cbIscritti.SelectedItem.ToString().Split('-')[0]);
                utilities.Delete("Iscrizioni", iscritto, "IdIscritto=");

                for (int i = 0; i < idCorsi.Count; i++)
                {
                    String query = "SELECT * FROM Iscrizioni WHERE IdIscritto=" + iscritto + " AND IdCorso=" +idCorsi[i];
                    DataTable dataTable = new DataTable();
                    SqlCommand cmd;
                    cmd = new SqlCommand(query, conn);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    SqlDataReader dr = cmd.ExecuteReader();
                    dataTable.Load(dr);

                    if (dataTable.Rows.Count == 0) 
                    {
                        int cont = utilities.GetContatore("Iscrizioni");
                        String query2 = "INSERT INTO Iscrizioni (IdIscrizione, IdIscritto, IdCorso) VALUES(@IdIscrizione, @IdIscritto, @IdCorso)";

                        SqlCommand comm = new SqlCommand(query2, conn);
                        comm.Parameters.AddWithValue("@IdIscrizione", cont);
                        comm.Parameters.AddWithValue("@IdIscritto", iscritto);
                        comm.Parameters.AddWithValue("@IdCorso", idCorsi[i]);
                        comm.ExecuteNonQuery();
                        utilities.SetContatore("Iscrizioni", cont);
                    }
                }
                

                

                this.Controls.Clear();
                this.InitializeComponent();
                Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
                this.Close();
                iscrizioni.Show();
            }

        }
    }
}
