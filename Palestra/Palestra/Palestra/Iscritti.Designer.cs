
namespace Palestra
{
    partial class Iscritti
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
            this.components = new System.ComponentModel.Container();
            this.btnLogout = new System.Windows.Forms.Button();
            this.lblCorsi = new System.Windows.Forms.Label();
            this.lblIscrizioni = new System.Windows.Forms.Label();
            this.lblVisualizza = new System.Windows.Forms.Label();
            this.lblIscritti = new System.Windows.Forms.Label();
            this.lblHome = new System.Windows.Forms.Label();
            this.cxtIscritti = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.cxtModifica = new System.Windows.Forms.ToolStripMenuItem();
            this.cxtElimina = new System.Windows.Forms.ToolStripMenuItem();
            this.btnAggiungi = new System.Windows.Forms.Button();
            this.gridIscritti = new System.Windows.Forms.DataGridView();
            this.cxtIscritti.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridIscritti)).BeginInit();
            this.SuspendLayout();
            // 
            // btnLogout
            // 
            this.btnLogout.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogout.Location = new System.Drawing.Point(912, 12);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(144, 41);
            this.btnLogout.TabIndex = 100;
            this.btnLogout.Text = "LOGOUT";
            this.btnLogout.UseVisualStyleBackColor = true;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // lblCorsi
            // 
            this.lblCorsi.AutoSize = true;
            this.lblCorsi.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCorsi.Location = new System.Drawing.Point(189, 25);
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
            this.lblIscrizioni.Location = new System.Drawing.Point(267, 25);
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
            this.lblVisualizza.Location = new System.Drawing.Point(369, 25);
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
            this.lblIscritti.Location = new System.Drawing.Point(111, 25);
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
            // cxtIscritti
            // 
            this.cxtIscritti.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cxtModifica,
            this.cxtElimina});
            this.cxtIscritti.Name = "cxtIscritti";
            this.cxtIscritti.Size = new System.Drawing.Size(122, 48);
            // 
            // cxtModifica
            // 
            this.cxtModifica.Name = "cxtModifica";
            this.cxtModifica.Size = new System.Drawing.Size(121, 22);
            this.cxtModifica.Text = "Modifica";
            this.cxtModifica.Click += new System.EventHandler(this.cxtModifica_Click);
            // 
            // cxtElimina
            // 
            this.cxtElimina.Name = "cxtElimina";
            this.cxtElimina.Size = new System.Drawing.Size(121, 22);
            this.cxtElimina.Text = "Elimina";
            this.cxtElimina.Click += new System.EventHandler(this.cxtElimina_Click);
            // 
            // btnAggiungi
            // 
            this.btnAggiungi.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAggiungi.Location = new System.Drawing.Point(17, 83);
            this.btnAggiungi.Name = "btnAggiungi";
            this.btnAggiungi.Size = new System.Drawing.Size(150, 34);
            this.btnAggiungi.TabIndex = 17;
            this.btnAggiungi.Text = "AGGIUNGI";
            this.btnAggiungi.UseVisualStyleBackColor = true;
            this.btnAggiungi.Click += new System.EventHandler(this.btnAggiungi_Click);
            // 
            // gridIscritti
            // 
            this.gridIscritti.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridIscritti.ContextMenuStrip = this.cxtIscritti;
            this.gridIscritti.Location = new System.Drawing.Point(17, 169);
            this.gridIscritti.Name = "gridIscritti";
            this.gridIscritti.ReadOnly = true;
            this.gridIscritti.Size = new System.Drawing.Size(1039, 374);
            this.gridIscritti.TabIndex = 18;
            // 
            // Iscritti
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(1068, 598);
            this.Controls.Add(this.gridIscritti);
            this.Controls.Add(this.btnAggiungi);
            this.Controls.Add(this.lblCorsi);
            this.Controls.Add(this.lblIscrizioni);
            this.Controls.Add(this.lblVisualizza);
            this.Controls.Add(this.lblIscritti);
            this.Controls.Add(this.lblHome);
            this.Controls.Add(this.btnLogout);
            this.Name = "Iscritti";
            this.Text = "Iscritti";
            this.cxtIscritti.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridIscritti)).EndInit();
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
        private System.Windows.Forms.ContextMenuStrip cxtIscritti;
        private System.Windows.Forms.ToolStripMenuItem cxtModifica;
        private System.Windows.Forms.ToolStripMenuItem cxtElimina;
        private System.Windows.Forms.Button btnAggiungi;
        private System.Windows.Forms.DataGridView gridIscritti;
    }
}