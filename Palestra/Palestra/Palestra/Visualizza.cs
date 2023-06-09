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
   
    public partial class Visualizza : Form
    { 
        SqlConnection conn;
        Utilities utilities;
        public Visualizza( SqlConnection c, Utilities u)
        {
            InitializeComponent();
            conn = c;
            utilities = u;
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            this.Hide();
            login.Show();
        }

        private void lblIscritti_Click(object sender, EventArgs e)
        {
            Iscritti iscritti = new Iscritti(conn, utilities);
            this.Close();
            iscritti.Show();
        }

        private void lblHome_Click(object sender, EventArgs e)
        {
            HomeAdmin home = new HomeAdmin(conn, utilities);
            this.Close();
            home.Show();
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

        private void btnCerca_Click(object sender, EventArgs e)
        {
            if( txtNome.Text.Trim().Length >20 || txtCognome.Text.Trim().Length >20 || txtCorso.Text.Trim().Length > 20)
            {
                MessageBox.Show("Ci sono dei campi che hanno superato la lunghezza massima", "Errore");
                this.Controls.Clear();
                this.InitializeComponent();
                Visualizza visualizza = new Visualizza( conn, utilities);
                this.Close();
                visualizza.Show();
            }
            else
            {
                String where = "";

                if (txtNome.Text.Trim() != "")
                {
                    where += "AND Iscritti.Nome LIKE '" + txtNome.Text+"'";
                }

                if (txtCognome.Text.Trim() != "")
                {
                    where += "AND Iscritti.Cognome LIKE '" + txtCognome.Text + "'";
                }

                if (txtCorso.Text.Trim() != "")
                {
                    where += "AND Corsi.NomeCorso LIKE '" + txtCorso.Text + "%'";
                }

                
                 gridVisualizza.DataSource = utilities.GetInnerJoin("Iscrizioni", "Iscritti", "Corsi", where);
                

                
            }
        }
    }
}
