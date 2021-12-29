namespace TicketSystem
{
    partial class FormEventsAdmin
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
            this.eventsTableAdapter1 = new TicketSystem.TicketSystemDataSetTableAdapters.EventsTableAdapter();
            this.SuspendLayout();
            // 
            // eventsTableAdapter1
            // 
            this.eventsTableAdapter1.ClearBeforeFill = true;
            // 
            // FormEventsAdmin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Name = "FormEventsAdmin";
            this.Text = "FormEventsAdmin";
            this.Load += new System.EventHandler(this.FormEventsAdmin_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private TicketSystemDataSetTableAdapters.EventsTableAdapter eventsTableAdapter1;
    }
}