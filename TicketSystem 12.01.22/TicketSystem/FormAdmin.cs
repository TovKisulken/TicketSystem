using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TicketSystem
{
    public partial class FormAdmin : Form
    {
        public FormAdmin()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Открытие формы с мероприятиями
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonEvents_Click(object sender, EventArgs e)
        {
            FormEventsAdmin fea = new FormEventsAdmin();
            this.Hide();
            fea.ShowDialog();
            this.Show();
        }

        /// <summary>
        /// Выход из системы
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
