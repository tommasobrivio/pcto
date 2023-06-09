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
    public partial class HomeAdmin : Form
    {

        DataTable dataTable;
        SqlConnection conn;
        Utilities utilities;

        public HomeAdmin()
        {
            InitializeComponent();
            conn = new SqlConnection();
            dataTable = new DataTable();
            conn.ConnectionString =
                "Data Source=ANDREA-DEV\\SQLEXPRESS;" +
                "Initial Catalog=Palestra;" +
                "User id=sa;" +
                 "Password=Gea$ql123;";
            utilities = new Utilities(conn);
            conn.Open();
        }

        public HomeAdmin(SqlConnection c,Utilities u)
        {
            InitializeComponent();
            conn = c;
            utilities = u;
            conn.Close();
            conn.Open();
        }

        private void btnIscritti_Click(object sender, EventArgs e)
        {
            Iscritti iscritti = new Iscritti(conn, utilities);
            this.Close();
            iscritti.Show();
        }

        private void btnIscrizioni_Click(object sender, EventArgs e)
        {
            Iscrizioni iscrizioni = new Iscrizioni(conn, utilities);
            this.Close();
            iscrizioni.Show();
        }

        private void btnVisualizza_Click(object sender, EventArgs e)
        {
            Visualizza visualizza = new Visualizza(conn, utilities);
            this.Close();
            visualizza.Show();
        }

        private void btnCorsi_Click(object sender, EventArgs e)
        {
            Corsi corsi =new Corsi(conn, utilities);
            this.Close();
            corsi.Show();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            this.Close();
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
    }
}
