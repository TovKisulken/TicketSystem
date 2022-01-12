using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TicketSystem
{
    public partial class FormAutorization : Form
    {
        TicketSystemDataSet.UsersDataTable dataUsers;

        public FormAutorization()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Отображение формы авторизации
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void FormAutorization_Load(object sender, EventArgs e)
        {
            //Получение всех записей из таблицы Users
            dataUsers = this.usersTableAdapter1.GetData();
            //Количество записей
            int totalCount = dataUsers.Count;
            //Отобразить полученные записи в компоненте
            this.dataGridViewUsers.DataSource = dataUsers;
            //Настроить компонент по ширине
            dataGridViewUsers.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            //Разрешить добавлять новые строки
            dataGridViewUsers.AllowUserToAddRows = false;
            //Настроить видимость нужных столбцов
            this.dataGridViewUsers.Columns["ID"].Visible = false;
            //Изменить заголовки столбцов таблицы
            this.dataGridViewUsers.Columns["IDRole"].HeaderText = "Роль";
            this.dataGridViewUsers.Columns["Login"].HeaderText = "Логин";
            this.dataGridViewUsers.Columns["Password"].HeaderText = "Пароль";
            this.checkBoxShowPass.Checked = false;
            textBoxPass.UseSystemPasswordChar = true;       //Пароль не видим
        }

        /// <summary>
        /// Вход в систему
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonEnter_Click(object sender, EventArgs e)
        {
            string log, pas;
            pas = this.textBoxPass.Text;
            log = this.textBoxLogin.Text;           //Исходные данные
            dataUsers = this.usersTableAdapter1.GetData();
            //Наложить на все записи фильтр на совпадение по логину и паролю
            var filter = dataUsers.Where(rec => rec.Login == log && rec.Password == pas);
            if (filter.Count() == 0)    //Нет записей – совпадение логина+пароля не найдено
            {
                MessageBox.Show("Таких данных нет.");
            }
            else                //Данные в БД есть
            {
                //Получение данных об этом пользователе и запись их в общий класс
                //Первая и единственная запись с 0 индексом
                ClassTotal.idUser = filter.ElementAt(0).ID;
                ClassTotal.idRole = filter.ElementAt(0).IDRole;
                ClassTotal.login = filter.ElementAt(0).Login;
                //Переход к формам в зависимости от роли
                switch (ClassTotal.idRole)
                {
                    case 1:
                        MessageBox.Show("Вы успешно авторизовались как администратор.");
                        FormAdmin fa = new FormAdmin();
                        this.Hide();
                        fa.ShowDialog();
                        this.Show();
                        break;
                    case 2:
                        MessageBox.Show("Вы успешно авторизовались как продавец.");
                        FormSeller fs = new FormSeller();
                        this.Hide();
                        fs.ShowDialog();
                        this.Show();
                        break;
                    case 3:
                        MessageBox.Show("Вы успешно авторизовались как организатор.");
                        FormOrganizer fo = new FormOrganizer();
                        this.Hide();
                        fo.ShowDialog();
                        this.Show();
                        break;
                }
            }
        }

        /// <summary>
        /// Выход из системы
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void buttonBuyTicket_Click(object sender, EventArgs e)
        {
            FormBuyer fb = new FormBuyer();
            this.Hide();
            fb.ShowDialog();
            this.Show();
        }
    }
}
