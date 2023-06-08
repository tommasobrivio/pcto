
namespace Palestra
{
    partial class Iscrizioni
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
            this.btnIscrivi = new System.Windows.Forms.Button();
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
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
            // btnIscrivi
            // 
            this.btnIscrivi.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnIscrivi.Location = new System.Drawing.Point(17, 82);
            this.btnIscrivi.Name = "btnIscrivi";
            this.btnIscrivi.Size = new System.Drawing.Size(122, 40);
            this.btnIscrivi.TabIndex = 16;
            this.btnIscrivi.Text = "ISCRIVI";
            this.btnIscrivi.UseVisualStyleBackColor = true;
            // 
            // checkedListBox1
            // 
            this.checkedListBox1.FormattingEnabled = true;
            this.checkedListBox1.Location = new System.Drawing.Point(17, 149);
            this.checkedListBox1.Name = "checkedListBox1";
            this.checkedListBox1.Size = new System.Drawing.Size(377, 289);
            this.checkedListBox1.TabIndex = 17;
            // 
            // Iscrizioni
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.checkedListBox1);
            this.Controls.Add(this.btnIscrivi);
            this.Controls.Add(this.lblCorsi);
            this.Controls.Add(this.lblIscrizioni);
            this.Controls.Add(this.lblVisualizza);
            this.Controls.Add(this.lblIscritti);
            this.Controls.Add(this.lblHome);
            this.Controls.Add(this.btnLogout);
            this.Name = "Iscrizioni";
            this.Text = "Iscrizioni";
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
        private System.Windows.Forms.Button btnIscrivi;
        private System.Windows.Forms.CheckedListBox checkedListBox1;
    }
}