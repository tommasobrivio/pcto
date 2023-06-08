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
    public partial class addEditIscritto : Form
    {
        String percorso = "";
        Utilities utilities;
        SqlConnection conn;
        int id =0;
        public addEditIscritto()
        {
            InitializeComponent();
        }

        public addEditIscritto(String operazione, SqlConnection c, Utilities u)
        {
            InitializeComponent();
            if (operazione == "add")
            {
                conn = c;
                utilities = u;
                btnEdit.Visible = false;
            }

            else
            {
                MessageBox.Show("hai sbagliato costruttore");
                Close();
            }

            
        }

        public addEditIscritto(String operazione, int indice, SqlConnection c, Utilities u)
        {
            InitializeComponent();
            if (operazione == "edit")
            {
                conn = c;
                btnAdd.Visible = false;
                btnEdit.Visible = true;
                id = indice;
                utilities = u;
            }
            else
            {
                MessageBox.Show("hai sbagliato costruttore");
                Close();
            }

            String[] split=utilities.GetRecord("Iscritti", indice, "IdIscritto=").Split(';');

            txtNome.Text = split[1];
            txtCognome.Text = split[2];
            txtEta.Text = split[3];
            txtIndirizzo.Text = split[4];
            txtProvincia.Text = split[5];
            txtCAP.Text = split[6];
            txtCitta.Text = split[7];

            imgProfilo.ImageLocation= split[9];

            //caricare la foto dalla tabella
            //inserire nei campi i dati per poter modificare

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Int32.Parse(txtEta.Text) >= 10 && Int32.Parse(txtEta.Text) <= 80)
                {
                    int eta = Int32.Parse(txtEta.Text);

                    if (cal1.SelectionRange.Start.ToString() != "")
                    {
                        if (txtNome.Text.Trim() == "" || txtCognome.Text.Trim() == "" || txtEta.Text.Trim() == "" ||
                            txtNome.Text.Trim().Length > 20 || txtCognome.Text.Trim().Length > 20 )
                        {
                            MessageBox.Show("Ci sono dei campi che sono obbligatori che sono vuoti, o hanno superato l lunghezza massima", "Errore");
                            this.Controls.Clear();
                            this.InitializeComponent();
                            addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                            this.Close();
                            ae.Show();
                        }
                        else
                        {
                            int cont = utilities.GetContatore("Iscritti");

                            String query = "INSERT INTO Iscritti (IdIscritto, Nome, Cognome,Eta,Indirizzo,Provincia,CAP,Citta,DataIscrizione,Immagine)" +
                                    "VALUES (" + cont + " ,@Nome, @Cognome, @Eta, @Indirizzo,@Provincia,@CAP, @Citta,@DataIscrizione,@Immagine)";
                            SqlCommand comm = new SqlCommand(query, conn);

                            comm.Parameters.AddWithValue("@Nome", txtNome.Text);
                            comm.Parameters.AddWithValue("@Cognome", txtCognome.Text);
                            comm.Parameters.AddWithValue("@Eta", eta);
                            comm.Parameters.AddWithValue("@Indirizzo", txtIndirizzo.Text);
                            comm.Parameters.AddWithValue("@Provincia", txtProvincia.Text);
                            comm.Parameters.AddWithValue("@CAP", txtCAP.Text);
                            comm.Parameters.AddWithValue("@Citta", txtCitta.Text);
                            comm.Parameters.AddWithValue("@DataIscrizione", cal1.SelectionRange.Start.ToString("yyyy-MM-dd"));
                            comm.Parameters.AddWithValue("@Immagine", percorso);
                            comm.ExecuteNonQuery();

                            utilities.SetContatore("Iscritti", cont);

                            conn.Close();

                            Iscritti iscritti = new Iscritti(conn, utilities);
                            this.Close();
                            iscritti.Show();

                        }
                    }
                    else
                    {
                        MessageBox.Show("Non hai selezionato nessuna data", "Errore");
                        this.Controls.Clear();
                        this.InitializeComponent();
                        addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                        this.Close();
                        ae.Show();
                    }

                }
                else
                {
                    MessageBox.Show("Errore sull' età (l' iscritto deve avere almeno 10 anni e meno di 80)", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                    this.Close();
                    ae.Show();
                }
            }
            catch
            {
                Exception exception = new Exception();
                MessageBox.Show("Errore sull' età (l' iscritto deve avere almeno 10 anni e meno di 80)", "Errore");
            }
            
            
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Int32.Parse(txtEta.Text) >= 10 && Int32.Parse(txtEta.Text) <= 80)
                {
                    int eta = Int32.Parse(txtEta.Text);

                    if (cal1.SelectionRange.Start.ToString() != "")
                    {
                        if (txtNome.Text.Trim() == "" || txtCognome.Text.Trim() == "" || txtEta.Text.Trim() == "" ||
                            txtNome.Text.Trim().Length > 20 || txtCognome.Text.Trim().Length > 20)
                        {
                            MessageBox.Show("Ci sono dei campi che sono obbligatori che sono vuoti, o hanno superato l lunghezza massima", "Errore");
                            this.Controls.Clear();
                            this.InitializeComponent();
                            addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                            this.Close();
                            ae.Show();
                        }
                        else
                        {
                            

                            String query = "INSERT INTO Iscritti (IdIscritto, Nome, Cognome,Eta,Indirizzo,Provincia,CAP,Citta,DataIscrizione,Immagine)" +
                                    "VALUES (" + cont + " ,@Nome, @Cognome, @Eta, @Indirizzo,@Provincia,@CAP, @Citta,@DataIscrizione,@Immagine)";
                            SqlCommand comm = new SqlCommand(query, conn);

                            comm.Parameters.AddWithValue("@Nome", txtNome.Text);
                            comm.Parameters.AddWithValue("@Cognome", txtCognome.Text);
                            comm.Parameters.AddWithValue("@Eta", eta);
                            comm.Parameters.AddWithValue("@Indirizzo", txtIndirizzo.Text);
                            comm.Parameters.AddWithValue("@Provincia", txtProvincia.Text);
                            comm.Parameters.AddWithValue("@CAP", txtCAP.Text);
                            comm.Parameters.AddWithValue("@Citta", txtCitta.Text);
                            comm.Parameters.AddWithValue("@DataIscrizione", cal1.SelectionRange.Start.ToString("yyyy-MM-dd"));
                            comm.Parameters.AddWithValue("@Immagine", percorso);
                            comm.ExecuteNonQuery();

                            utilities.SetContatore("Iscritti", cont);

                            conn.Close();

                            Iscritti iscritti = new Iscritti(conn, utilities);
                            this.Close();
                            iscritti.Show();

                        }
                    }
                    else
                    {
                        MessageBox.Show("Non hai selezionato nessuna data", "Errore");
                        this.Controls.Clear();
                        this.InitializeComponent();
                        addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                        this.Close();
                        ae.Show();
                    }

                }
                else
                {
                    MessageBox.Show("Errore sull' età (l' iscritto deve avere almeno 10 anni e meno di 80)", "Errore");
                    this.Controls.Clear();
                    this.InitializeComponent();
                    addEditIscritto ae = new addEditIscritto("add", conn, utilities);
                    this.Close();
                    ae.Show();
                }
            }
            catch
            {
                Exception exception = new Exception();
                MessageBox.Show("Errore sull' età (l' iscritto deve avere almeno 10 anni e meno di 80)", "Errore");
            }


        }
    

        private void btnFoto_Click(object sender, EventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            DialogResult dr = op.ShowDialog();
            if (dr == DialogResult.OK && op.FileName != "")
            {
                percorso = op.FileName;
            }
            else
            {
                MessageBox.Show("Non hai selezionato alcuna immagine", "Errore");
            }
        }

        private void txtNome_TextChanged(object sender, EventArgs e)
        {
            if (txtNome.Text == "")
            {
                txtNome.BackColor = Color.FromArgb(255,128,128);
            }
            else
                txtNome.BackColor = Color.White;
        }

        private void txtCognome_TextChanged(object sender, EventArgs e)
        {
            if (txtCognome.Text == "")
            {
                txtCognome.BackColor = Color.FromArgb(255, 128, 128);
            }
            else
                txtCognome.BackColor = Color.White;
        }

        private void txtEta_TextChanged(object sender, EventArgs e)
        {
            if (txtEta.Text == "")
            {
                txtEta.BackColor = Color.FromArgb(255, 128, 128);
            }
            else
                txtEta.BackColor = Color.White;
        }

    }
}
