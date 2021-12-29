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
    public partial class FormEventsAdmin : Form
    {
        TicketSystemDataSet.EventsDataTable dataEvents;

        public FormEventsAdmin()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Отображение формы
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FormEventsAdmin_Load(object sender, EventArgs e)
        {
            //Получение всех записей из таблицы
            dataEvents = this.eventsTableAdapter1.GetData();
            //Количество записей
            int totalCount = dataEvents.Count;
            //Отобразить полученные записи в компоненте
            this.dataGridViewEvents.DataSource = dataEvents;
            //Настроить компонент по ширине
            dataGridViewEvents.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            //Разрешить добавлять новые строки
            dataGridViewEvents.AllowUserToAddRows = false;
        }
    }
}
