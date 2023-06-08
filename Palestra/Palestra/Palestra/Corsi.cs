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
        public Corsi(SqlConnection c, Utilities u)
        {
            InitializeComponent();
            dataTable = new DataTable();
            conn = c;
            utilities = u;
            btnInvia.Visible = false;
            txtAdd.Visible = false;
            lblNome.Visible = false;

            //aggiungere nella list i corsi dalla tabella
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
            lblNome.Visible = true;
            txtAdd.Visible = true;
            btnInvia.Visible = true;
            btnAdd.Visible = false;
        }
    }
}
