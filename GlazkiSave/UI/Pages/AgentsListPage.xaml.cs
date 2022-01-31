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
using GlazkiSave.Utilities;
using GlazkiSave.Entities;
using GlazkiSave.UI.Pages;

namespace GlazkiSave.UI.Pages
{
    /// <summary>
    /// Логика взаимодействия для AgentsListPage.xaml
    /// </summary>
    public partial class AgentsListPage : Page
    {
        public AgentsListPage()
        {
            InitializeComponent();
            agentsListView.ItemsSource = Transition.Context.Agent.ToList();

            var Filteritems = Transition.Context.AgentType.ToList();
            Filteritems.Insert(0, new AgentType {Title = "Все типы"});
            filterComboBox.ItemsSource = Filteritems.ToList();
            filterComboBox.SelectedIndex = 0;
            sortComboBox.SelectedIndex = 0;
        }
        #region Sorting
        void Sorting()
        {
            var items = Transition.Context.Agent.ToList();
            if (filterComboBox.SelectedIndex > 0)
            {
                items = items.Where(x => x.AgentTypeID == filterComboBox.SelectedIndex).ToList();
            }
            if (sortComboBox.SelectedIndex > 0)
            {
                switch (sortComboBox.SelectedIndex)
                {
                    case 1:
                        {
                            if ((bool)ascDescCheckBox.IsChecked)
                                items = items.OrderByDescending(x => x.Title).ToList();
                            else
                                items = items.OrderBy(x => x.Title).ToList();
                            break;
                        }
                    case 2:
                        {
                            if ((bool)ascDescCheckBox.IsChecked)
                                items = items.OrderByDescending(x => x.Priority).ToList();
                            else
                                items = items.OrderBy(x => x.Priority).ToList();
                            break;
                        }
                }
            }
            if (searchTextBox.Text.Length > 0)
            {
                items = items.Where(x => x.Title.ToLower().Contains(searchTextBox.Text.ToLower())
                                        || x.Email.ToLower().Contains(searchTextBox.Text.ToLower())
                                        || x.Phone.ToLower().Contains(searchTextBox.Text.ToLower())).ToList();
            }
            agentsListView.ItemsSource = items;
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            Sorting();
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            Sorting();
        }

        private void sortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sorting();
        }

        private void filterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sorting();
        }

        private void searchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sorting();
        }
        #endregion
        private void deleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var itemToDelete = agentsListView.SelectedItem as Agent;
            if (itemToDelete != null)
            {
                if (MessageBox.Show($"Вы действительно хотите удалить запись №{itemToDelete.ID}", "Удаление данных", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    Transition.Context.Agent.Remove(itemToDelete);
                    try
                    {
                        Transition.Context.SaveChanges();
                        MessageBox.Show($"Данные удалены", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
                else
                    return;
            }
            Sorting();
        }

        private void editBtn_Click(object sender, RoutedEventArgs e)
        {
            Transition.mainFrame.Navigate(new AddEditPage(agentsListView.SelectedItem as Agent));
            Sorting();
        }

        private void addBtn_Click(object sender, RoutedEventArgs e)
        {
            Transition.mainFrame.Navigate(new AddEditPage(null));
            Sorting();
        }

        private void agentsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            editBtn.Visibility = Visibility.Visible;
            deleteBtn.Visibility = Visibility.Visible;
        }
    }
}
