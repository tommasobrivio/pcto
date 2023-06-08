
namespace Palestra
{
    partial class addEditIscritto
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
            this.txtNome = new System.Windows.Forms.TextBox();
            this.txtIndirizzo = new System.Windows.Forms.TextBox();
            this.txtEta = new System.Windows.Forms.TextBox();
            this.txtCognome = new System.Windows.Forms.TextBox();
            this.txtProvincia = new System.Windows.Forms.TextBox();
            this.txtCAP = new System.Windows.Forms.TextBox();
            this.lblNome = new System.Windows.Forms.Label();
            this.lblData = new System.Windows.Forms.Label();
            this.lblCAP = new System.Windows.Forms.Label();
            this.lblProvincia = new System.Windows.Forms.Label();
            this.lblIndirizzo = new System.Windows.Forms.Label();
            this.lblEta = new System.Windows.Forms.Label();
            this.lblCognome = new System.Windows.Forms.Label();
            this.btnFoto = new System.Windows.Forms.Button();
            this.imgProfilo = new System.Windows.Forms.PictureBox();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.lblCitta = new System.Windows.Forms.Label();
            this.txtCitta = new System.Windows.Forms.TextBox();
            this.cal1 = new System.Windows.Forms.MonthCalendar();
            ((System.ComponentModel.ISupportInitialize)(this.imgProfilo)).BeginInit();
            this.SuspendLayout();
            // 
            // txtNome
            // 
            this.txtNome.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.txtNome.ForeColor = System.Drawing.Color.Black;
            this.txtNome.Location = new System.Drawing.Point(268, 60);
            this.txtNome.Name = "txtNome";
            this.txtNome.Size = new System.Drawing.Size(210, 20);
            this.txtNome.TabIndex = 0;
            this.txtNome.TextChanged += new System.EventHandler(this.txtNome_TextChanged);
            // 
            // txtIndirizzo
            // 
            this.txtIndirizzo.Location = new System.Drawing.Point(268, 165);
            this.txtIndirizzo.Name = "txtIndirizzo";
            this.txtIndirizzo.Size = new System.Drawing.Size(210, 20);
            this.txtIndirizzo.TabIndex = 3;
            // 
            // txtEta
            // 
            this.txtEta.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.txtEta.Location = new System.Drawing.Point(268, 129);
            this.txtEta.Name = "txtEta";
            this.txtEta.Size = new System.Drawing.Size(210, 20);
            this.txtEta.TabIndex = 2;
            this.txtEta.TextChanged += new System.EventHandler(this.txtEta_TextChanged);
            // 
            // txtCognome
            // 
            this.txtCognome.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.txtCognome.Location = new System.Drawing.Point(268, 94);
            this.txtCognome.Name = "txtCognome";
            this.txtCognome.Size = new System.Drawing.Size(210, 20);
            this.txtCognome.TabIndex = 1;
            this.txtCognome.TextChanged += new System.EventHandler(this.txtCognome_TextChanged);
            // 
            // txtProvincia
            // 
            this.txtProvincia.Location = new System.Drawing.Point(268, 203);
            this.txtProvincia.Name = "txtProvincia";
            this.txtProvincia.Size = new System.Drawing.Size(210, 20);
            this.txtProvincia.TabIndex = 4;
            // 
            // txtCAP
            // 
            this.txtCAP.Location = new System.Drawing.Point(269, 236);
            this.txtCAP.Name = "txtCAP";
            this.txtCAP.Size = new System.Drawing.Size(210, 20);
            this.txtCAP.TabIndex = 5;
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNome.Location = new System.Drawing.Point(42, 55);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(62, 24);
            this.lblNome.TabIndex = 8;
            this.lblNome.Text = "Nome";
            // 
            // lblData
            // 
            this.lblData.AutoSize = true;
            this.lblData.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblData.Location = new System.Drawing.Point(42, 310);
            this.lblData.Name = "lblData";
            this.lblData.Size = new System.Drawing.Size(131, 24);
            this.lblData.TabIndex = 11;
            this.lblData.Text = "Data iscrizione";
            // 
            // lblCAP
            // 
            this.lblCAP.AutoSize = true;
            this.lblCAP.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCAP.Location = new System.Drawing.Point(42, 237);
            this.lblCAP.Name = "lblCAP";
            this.lblCAP.Size = new System.Drawing.Size(48, 24);
            this.lblCAP.TabIndex = 12;
            this.lblCAP.Text = "CAP";
            // 
            // lblProvincia
            // 
            this.lblProvincia.AutoSize = true;
            this.lblProvincia.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblProvincia.Location = new System.Drawing.Point(42, 198);
            this.lblProvincia.Name = "lblProvincia";
            this.lblProvincia.Size = new System.Drawing.Size(87, 24);
            this.lblProvincia.TabIndex = 13;
            this.lblProvincia.Text = "Provincia";
            // 
            // lblIndirizzo
            // 
            this.lblIndirizzo.AutoSize = true;
            this.lblIndirizzo.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIndirizzo.Location = new System.Drawing.Point(42, 160);
            this.lblIndirizzo.Name = "lblIndirizzo";
            this.lblIndirizzo.Size = new System.Drawing.Size(79, 24);
            this.lblIndirizzo.TabIndex = 14;
            this.lblIndirizzo.Text = "Indirizzo";
            // 
            // lblEta
            // 
            this.lblEta.AutoSize = true;
            this.lblEta.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblEta.Location = new System.Drawing.Point(42, 124);
            this.lblEta.Name = "lblEta";
            this.lblEta.Size = new System.Drawing.Size(37, 24);
            this.lblEta.TabIndex = 15;
            this.lblEta.Text = "Età";
            // 
            // lblCognome
            // 
            this.lblCognome.AutoSize = true;
            this.lblCognome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCognome.Location = new System.Drawing.Point(42, 89);
            this.lblCognome.Name = "lblCognome";
            this.lblCognome.Size = new System.Drawing.Size(94, 24);
            this.lblCognome.TabIndex = 16;
            this.lblCognome.Text = "Cognome";
            // 
            // btnFoto
            // 
            this.btnFoto.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFoto.Location = new System.Drawing.Point(46, 396);
            this.btnFoto.Name = "btnFoto";
            this.btnFoto.Size = new System.Drawing.Size(149, 43);
            this.btnFoto.TabIndex = 8;
            this.btnFoto.Text = "SCEGLI FOTO";
            this.btnFoto.UseVisualStyleBackColor = true;
            this.btnFoto.Click += new System.EventHandler(this.btnFoto_Click);
            // 
            // imgProfilo
            // 
            this.imgProfilo.ErrorImage = global::Palestra.Properties.Resources.icona;
            this.imgProfilo.Location = new System.Drawing.Point(650, 59);
            this.imgProfilo.Name = "imgProfilo";
            this.imgProfilo.Size = new System.Drawing.Size(276, 238);
            this.imgProfilo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.imgProfilo.TabIndex = 18;
            this.imgProfilo.TabStop = false;
            // 
            // btnEdit
            // 
            this.btnEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEdit.Location = new System.Drawing.Point(777, 396);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(149, 43);
            this.btnEdit.TabIndex = 100;
            this.btnEdit.Text = "SALVA";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(777, 396);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(149, 43);
            this.btnAdd.TabIndex = 100;
            this.btnAdd.Text = "AGGIUNGI";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // lblCitta
            // 
            this.lblCitta.AutoSize = true;
            this.lblCitta.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCitta.Location = new System.Drawing.Point(42, 268);
            this.lblCitta.Name = "lblCitta";
            this.lblCitta.Size = new System.Drawing.Size(45, 24);
            this.lblCitta.TabIndex = 22;
            this.lblCitta.Text = "Città";
            // 
            // txtCitta
            // 
            this.txtCitta.Location = new System.Drawing.Point(268, 273);
            this.txtCitta.Name = "txtCitta";
            this.txtCitta.Size = new System.Drawing.Size(210, 20);
            this.txtCitta.TabIndex = 6;
            // 
            // cal1
            // 
            this.cal1.Location = new System.Drawing.Point(268, 310);
            this.cal1.MaxSelectionCount = 1;
            this.cal1.Name = "cal1";
            this.cal1.TabIndex = 7;
            // 
            // addEditIscritto
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(1030, 510);
            this.Controls.Add(this.cal1);
            this.Controls.Add(this.lblCitta);
            this.Controls.Add(this.txtCitta);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.btnEdit);
            this.Controls.Add(this.imgProfilo);
            this.Controls.Add(this.btnFoto);
            this.Controls.Add(this.lblCognome);
            this.Controls.Add(this.lblEta);
            this.Controls.Add(this.lblIndirizzo);
            this.Controls.Add(this.lblProvincia);
            this.Controls.Add(this.lblCAP);
            this.Controls.Add(this.lblData);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.txtCAP);
            this.Controls.Add(this.txtProvincia);
            this.Controls.Add(this.txtCognome);
            this.Controls.Add(this.txtEta);
            this.Controls.Add(this.txtIndirizzo);
            this.Controls.Add(this.txtNome);
            this.Name = "addEditIscritto";
            this.Text = "addEditIscritto";
            ((System.ComponentModel.ISupportInitialize)(this.imgProfilo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.TextBox txtIndirizzo;
        private System.Windows.Forms.TextBox txtEta;
        private System.Windows.Forms.TextBox txtCognome;
        private System.Windows.Forms.TextBox txtProvincia;
        private System.Windows.Forms.TextBox txtCAP;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.Label lblData;
        private System.Windows.Forms.Label lblCAP;
        private System.Windows.Forms.Label lblProvincia;
        private System.Windows.Forms.Label lblIndirizzo;
        private System.Windows.Forms.Label lblEta;
        private System.Windows.Forms.Label lblCognome;
        private System.Windows.Forms.Button btnFoto;
        private System.Windows.Forms.PictureBox imgProfilo;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label lblCitta;
        private System.Windows.Forms.TextBox txtCitta;
        private System.Windows.Forms.MonthCalendar cal1;
    }
}