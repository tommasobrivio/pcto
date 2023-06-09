
namespace Palestra
{
    partial class Visualizza
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnLogout = new System.Windows.Forms.Button();
            this.lblCorsi = new System.Windows.Forms.Label();
            this.lblIscrizioni = new System.Windows.Forms.Label();
            this.lblVisualizza = new System.Windows.Forms.Label();
            this.lblIscritti = new System.Windows.Forms.Label();
            this.lblHome = new System.Windows.Forms.Label();
            this.gridVisualizza = new System.Windows.Forms.DataGridView();
            this.txtNome = new System.Windows.Forms.TextBox();
            this.lblNome = new System.Windows.Forms.Label();
            this.lblCognome = new System.Windows.Forms.Label();
            this.txtCognome = new System.Windows.Forms.TextBox();
            this.lblCorso = new System.Windows.Forms.Label();
            this.txtCorso = new System.Windows.Forms.TextBox();
            this.btnCerca = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridVisualizza)).BeginInit();
            this.SuspendLayout();
            // 
            // btnLogout
            // 
            this.btnLogout.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogout.Location = new System.Drawing.Point(644, 12);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(144, 41);
            this.btnLogout.TabIndex = 5;
            this.btnLogout.Text = "LOGOUT";
            this.btnLogout.UseVisualStyleBackColor = true;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // lblCorsi
            // 
            this.lblCorsi.AutoSize = true;
            this.lblCorsi.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCorsi.Location = new System.Drawing.Point(191, 25);
            this.lblCorsi.Name = "lblCorsi";
            this.lblCorsi.Size = new System.Drawing.Size(52, 22);
            this.lblCorsi.TabIndex = 14;
            this.lblCorsi.Text = "Corsi";
            this.lblCorsi.Click += new System.EventHandler(this.lblCorsi_Click);
            // 
            // lblIscrizioni
            // 
            this.lblIscrizioni.AutoSize = true;
            this.lblIscrizioni.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIscrizioni.Location = new System.Drawing.Point(269, 25);
            this.lblIscrizioni.Name = "lblIscrizioni";
            this.lblIscrizioni.Size = new System.Drawing.Size(78, 22);
            this.lblIscrizioni.TabIndex = 13;
            this.lblIscrizioni.Text = "Iscrizioni";
            this.lblIscrizioni.Click += new System.EventHandler(this.lblIscrizioni_Click);
            // 
            // lblVisualizza
            // 
            this.lblVisualizza.AutoSize = true;
            this.lblVisualizza.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblVisualizza.Location = new System.Drawing.Point(371, 25);
            this.lblVisualizza.Name = "lblVisualizza";
            this.lblVisualizza.Size = new System.Drawing.Size(89, 22);
            this.lblVisualizza.TabIndex = 12;
            this.lblVisualizza.Text = "Visualizza";
            this.lblVisualizza.Click += new System.EventHandler(this.lblVisualizza_Click);
            // 
            // lblIscritti
            // 
            this.lblIscritti.AutoSize = true;
            this.lblIscritti.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIscritti.Location = new System.Drawing.Point(113, 25);
            this.lblIscritti.Name = "lblIscritti";
            this.lblIscritti.Size = new System.Drawing.Size(56, 22);
            this.lblIscritti.TabIndex = 11;
            this.lblIscritti.Text = "Iscritti";
            this.lblIscritti.Click += new System.EventHandler(this.lblIscritti_Click);
            // 
            // lblHome
            // 
            this.lblHome.AutoSize = true;
            this.lblHome.Font = new System.Drawing.Font("Microsoft Sans Serif", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHome.Location = new System.Drawing.Point(12, 21);
            this.lblHome.Name = "lblHome";
            this.lblHome.Size = new System.Drawing.Size(78, 26);
            this.lblHome.TabIndex = 10;
            this.lblHome.Text = "HOME";
            this.lblHome.Click += new System.EventHandler(this.lblHome_Click);
            // 
            // gridVisualizza
            // 
            this.gridVisualizza.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridVisualizza.Location = new System.Drawing.Point(12, 202);
            this.gridVisualizza.Name = "gridVisualizza";
            this.gridVisualizza.ReadOnly = true;
            this.gridVisualizza.Size = new System.Drawing.Size(776, 236);
            this.gridVisualizza.TabIndex = 15;
            // 
            // txtNome
            // 
            this.txtNome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNome.Location = new System.Drawing.Point(180, 85);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(147, 29);
            this.txtNome.TabIndex = 16;
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNome.Location = new System.Drawing.Point(13, 88);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(129, 24);
            this.lblNome.TabIndex = 17;
            this.lblNome.Text = "Nome iscritto: ";
            // 
            // lblCognome
            // 
            this.lblCognome.AutoSize = true;
            this.lblCognome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCognome.Location = new System.Drawing.Point(13, 127);
            this.lblCognome.Name = "lblCognome";
            this.lblCognome.Size = new System.Drawing.Size(161, 24);
            this.lblCognome.TabIndex = 19;
            this.lblCognome.Text = "Cognome iscritto: ";
            // 
            // txtCognome
            // 
            this.txtCognome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCognome.Location = new System.Drawing.Point(180, 124);
            this.txtCognome.Name = "txtCognome";
            this.txtCognome.Size = new System.Drawing.Size(147, 29);
            this.txtCognome.TabIndex = 18;
            // 
            // lblCorso
            // 
            this.lblCorso.AutoSize = true;
            this.lblCorso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCorso.Location = new System.Drawing.Point(12, 167);
            this.lblCorso.Name = "lblCorso";
            this.lblCorso.Size = new System.Drawing.Size(70, 24);
            this.lblCorso.TabIndex = 21;
            this.lblCorso.Text = "Corso: ";
            // 
            // txtCorso
            // 
            this.txtCorso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCorso.Location = new System.Drawing.Point(180, 164);
            this.txtCorso.Name = "txtCorso";
            this.txtCorso.Size = new System.Drawing.Size(147, 29);
            this.txtCorso.TabIndex = 20;
            // 
            // btnCerca
            // 
            this.btnCerca.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCerca.Location = new System.Drawing.Point(362, 164);
            this.btnCerca.Name = "btnCerca";
            this.btnCerca.Size = new System.Drawing.Size(88, 29);
            this.btnCerca.TabIndex = 22;
            this.btnCerca.Text = "CERCA";
            this.btnCerca.UseVisualStyleBackColor = true;
            this.btnCerca.Click += new System.EventHandler(this.btnCerca_Click);
            // 
            // Visualizza
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnCerca);
            this.Controls.Add(this.lblCorso);
            this.Controls.Add(this.txtCorso);
            this.Controls.Add(this.lblCognome);
            this.Controls.Add(this.txtCognome);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.txtNome);
            this.Controls.Add(this.gridVisualizza);
            this.Controls.Add(this.lblCorsi);
            this.Controls.Add(this.lblIscrizioni);
            this.Controls.Add(this.lblVisualizza);
            this.Controls.Add(this.lblIscritti);
            this.Controls.Add(this.lblHome);
            this.Controls.Add(this.btnLogout);
            this.Name = "Visualizza";
            this.Text = "Visualizza";
            ((System.ComponentModel.ISupportInitialize)(this.gridVisualizza)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnLogout;
        private System.Windows.Forms.Label lblCorsi;
        private System.Windows.Forms.Label lblIscrizioni;
        private System.Windows.Forms.Label lblVisualizza;
        private System.Windows.Forms.Label lblIscritti;
        private System.Windows.Forms.Label lblHome;
        private System.Windows.Forms.DataGridView gridVisualizza;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.Label lblCognome;
        private System.Windows.Forms.TextBox txtCognome;
        private System.Windows.Forms.Label lblCorso;
        private System.Windows.Forms.TextBox txtCorso;
        private System.Windows.Forms.Button btnCerca;
    }
}