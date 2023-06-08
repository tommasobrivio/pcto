using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Palestra
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            //if(txtUsername.Text=="admin" && txtPassword.Text == "admin")
            //{
                HomeAdmin home = new HomeAdmin();
                this.Hide();
                home.Show();
            /*}
            else
            {
                MessageBox.Show("Hai sbagliato o lo username o la password", "Errore");
            }*/
        }
    }
}
