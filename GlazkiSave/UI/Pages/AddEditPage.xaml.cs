using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using GlazkiSave.Entities;
using GlazkiSave.Utilities;

namespace GlazkiSave.UI.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        Agent currentAgent;
        public AddEditPage(Agent agent)
        {
            InitializeComponent();
            currentAgent = agent ?? new Agent();
            agentTypeComboBox.ItemsSource = Transition.Context.AgentType.ToList();
            DataContext = currentAgent;
        }

        private void cancelBtn_Click(object sender, RoutedEventArgs e)
        {
            Transition.mainFrame.GoBack();
        }

        private void saveBtn_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(currentAgent.Title))
                errors.AppendLine("Название");
            if (currentAgent.AgentType == null)
                errors.AppendLine("Тип агента");
            if (string.IsNullOrWhiteSpace(currentAgent.INN))
                errors.AppendLine("ИНН");
            if (string.IsNullOrWhiteSpace(currentAgent.Phone))
                errors.AppendLine("Номер телефона");
            if (!int.TryParse(currentAgent.Priority.ToString(), out _))
                errors.AppendLine("Приоритет");

            if (string.IsNullOrWhiteSpace(currentAgent.Email))
                currentAgent.Email = "";
            if (string.IsNullOrWhiteSpace(currentAgent.Logo))
                currentAgent.Logo = "";

            if (errors.Length > 0)
            {
                MessageBox.Show($"Заполните следующие поля:\n{errors.ToString()}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (currentAgent.ID == 0)
            {
                Transition.Context.Agent.Add(currentAgent);
            }

            try
            {
                Transition.Context.SaveChanges();
                MessageBox.Show($"Данные сохранены", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                Transition.mainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
