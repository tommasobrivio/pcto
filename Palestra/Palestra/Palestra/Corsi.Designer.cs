
namespace Palestra
{
    partial class Corsi
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
            this.lblNome = new System.Windows.Forms.Label();
            this.txtAdd = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.gridCorsi = new System.Windows.Forms.DataGridView();
            this.btnModifica = new System.Windows.Forms.Button();
            this.btnSalva = new System.Windows.Forms.Button();
            this.btnElimina = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridCorsi)).BeginInit();
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
            this.lblCorsi.Location = new System.Drawing.Point(185, 25);
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
            this.lblIscrizioni.Location = new System.Drawing.Point(263, 25);
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
            this.lblVisualizza.Location = new System.Drawing.Point(365, 25);
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
            this.lblIscritti.Location = new System.Drawing.Point(107, 25);
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
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNome.Location = new System.Drawing.Point(13, 77);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(114, 24);
            this.lblNome.TabIndex = 16;
            this.lblNome.Text = "Nome corso";
            // 
            // txtAdd
            // 
            this.txtAdd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.txtAdd.Location = new System.Drawing.Point(136, 82);
            this.txtAdd.Name = "txtAdd";
            this.txtAdd.Size = new System.Drawing.Size(210, 20);
            this.txtAdd.TabIndex = 15;
            this.txtAdd.TextChanged += new System.EventHandler(this.txtAdd_TextChanged);
            // 
            // btnAdd
            // 
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(393, 72);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(111, 35);
            this.btnAdd.TabIndex = 17;
            this.btnAdd.Text = "AGGIUNGI";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // gridCorsi
            // 
            this.gridCorsi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridCorsi.Location = new System.Drawing.Point(17, 137);
            this.gridCorsi.Name = "gridCorsi";
            this.gridCorsi.ReadOnly = true;
            this.gridCorsi.Size = new System.Drawing.Size(771, 301);
            this.gridCorsi.TabIndex = 19;
            // 
            // btnModifica
            // 
            this.btnModifica.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnModifica.Location = new System.Drawing.Point(510, 72);
            this.btnModifica.Name = "btnModifica";
            this.btnModifica.Size = new System.Drawing.Size(111, 35);
            this.btnModifica.TabIndex = 20;
            this.btnModifica.Text = "MODIFICA";
            this.btnModifica.UseVisualStyleBackColor = true;
            this.btnModifica.Click += new System.EventHandler(this.btnModifica_Click);
            // 
            // btnSalva
            // 
            this.btnSalva.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSalva.Location = new System.Drawing.Point(393, 72);
            this.btnSalva.Name = "btnSalva";
            this.btnSalva.Size = new System.Drawing.Size(111, 35);
            this.btnSalva.TabIndex = 21;
            this.btnSalva.Text = "SALVA";
            this.btnSalva.UseVisualStyleBackColor = true;
            this.btnSalva.Click += new System.EventHandler(this.btnSalva_Click);
            // 
            // btnElimina
            // 
            this.btnElimina.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnElimina.Location = new System.Drawing.Point(627, 72);
            this.btnElimina.Name = "btnElimina";
            this.btnElimina.Size = new System.Drawing.Size(111, 35);
            this.btnElimina.TabIndex = 22;
            this.btnElimina.Text = "ELIMINA";
            this.btnElimina.UseVisualStyleBackColor = true;
            this.btnElimina.Click += new System.EventHandler(this.btnElimina_Click);
            // 
            // Corsi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnElimina);
            this.Controls.Add(this.btnSalva);
            this.Controls.Add(this.btnModifica);
            this.Controls.Add(this.gridCorsi);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.lblNome);
            this.Controls.Add(this.txtAdd);
            this.Controls.Add(this.lblCorsi);
            this.Controls.Add(this.lblIscrizioni);
            this.Controls.Add(this.lblVisualizza);
            this.Controls.Add(this.lblIscritti);
            this.Controls.Add(this.lblHome);
            this.Controls.Add(this.btnLogout);
            this.Name = "Corsi";
            this.Text = "Corsi";
            ((System.ComponentModel.ISupportInitialize)(this.gridCorsi)).EndInit();
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
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.TextBox txtAdd;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.DataGridView gridCorsi;
        private System.Windows.Forms.Button btnModifica;
        private System.Windows.Forms.Button btnSalva;
        private System.Windows.Forms.Button btnElimina;
    }
}