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

namespace PracticaApp.Pages
{
    /// <summary>
    /// Interaction logic for ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public static List<Product> products;
        public static List<string> manufacturers = new List<string>();
        public static List<ProductPhoto> photos = new List<ProductPhoto>();
        public ProductPage()
        {
            InitializeComponent();
            products = MainWindow.ent.Product.ToList();
            photos= MainWindow.ent.ProductPhoto.ToList();
            manufacturers.Add("Все производители");
            foreach (Manufacturer manufacturer in MainWindow.ent.Manufacturer.ToList())
            {
                if (manufacturer != null)
                {
                    manufacturers.Add(manufacturer.Name);
                }
            }
            SetProducts(MainWindow.ent.Product.ToList());
            ManufacturerCB.ItemsSource = manufacturers;
            ProductsListView.ItemsSource = products;
            SetCount();
        }
        private void SortAscDescCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }
        private void FilterTypeCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }

        private void SearchName_TextChanged(object sender, TextChangedEventArgs e)
        {
            Filter();
        }
        private void Sort()
        {
            string sortValue = (SortAscDescCB.SelectedItem as ComboBoxItem).Content.ToString();
            if (sortValue == "По убыванию")
            {
                ProductsListView.ItemsSource = products.OrderByDescending(i => i.Cost);
            }
            else if (sortValue == "По возрастанию")
            {
                ProductsListView.ItemsSource = products.OrderBy(i => i.Cost);
            }
            SetCount();
        }
        private void SetProducts(List<Product> newProducts)
        {
            products = newProducts;
            ProductsListView.ItemsSource = products;
        }
        private void Filter()
        {
            if (SearchName.Text != "" && ManufacturerCB.SelectedItem != null)
            {
                if(ManufacturerCB.SelectedItem.ToString() == "Все производители")
                {
                    SetProducts(MainWindow.ent.Product.Where(c => c.Title.StartsWith(SearchName.Text)).ToList());
                }
                else
                {
                    SetProducts(MainWindow.ent.Product.Where(c => c.Title.StartsWith(SearchName.Text) && c.ManufacturerID
                               == ManufacturerCB.SelectedIndex).ToList());
                }
            }
            else if (SearchName.Text != "")
            {
                SetProducts(MainWindow.ent.Product.Where(c => c.Title.StartsWith(SearchName.Text)).ToList());
            }
            else if (ManufacturerCB.SelectedIndex != -1)
            {
                if (ManufacturerCB.SelectedItem.ToString() == "Все производители")
                {
                    SetProducts(MainWindow.ent.Product.ToList());
                }
                else
                {
                    SetProducts(MainWindow.ent.Product.Where(c => c.ManufacturerID == ManufacturerCB.SelectedIndex).ToList());
                }
            }
            SetCount();
        }
        private void SetCount()
        {
            CountTb.Text = ProductsListView.Items.Count.ToString();
            ActualCountTb.Text = MainWindow.ent.Product.Count().ToString();
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditProductPage(null, false));
        }

        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            Product product = ProductsListView.SelectedItem as Product;
            if(product != null)
            {
                NavigationService.Navigate(new AddEditProductPage(product, true));
            }
            else
            {
                MessageBox.Show("Выберите продукт для изменения!");
            }
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            Product pr = ProductsListView.SelectedItem as Product;
            if (pr != null)
            {
                var result = MessageBox.Show("Вы хотите удалить?", "Yes or No", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    
                    try
                    {
                        MainWindow.ent.Product.Remove(pr);
                        MainWindow.ent.SaveChanges();
                        ProductsListView.ItemsSource = MainWindow.ent.Product.ToList();
                        MessageBox.Show("Продукт удален!");
                        NavigationService.Navigate(new ProductPage());
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show("Сначала удалите связанные продукты!");
                    }
                    //foreach(ProductPhoto productPhoto in pr.ProductPhoto)
                    //{
                    //    pr.ProductPhoto.Remove(productPhoto);
                    //}
                    //MainWindow.ent.SaveChanges();
                    //foreach (Product product in pr.Product1)
                    //{
                    //    pr.Product1.Remove(product);
                    //}
                    //MainWindow.ent.SaveChanges();
                   
                }
                else
                {
                    MessageBox.Show("Операция отменена");
                }
            }
            else
            {
                MessageBox.Show("Выберите продукт");
            }
        }

        private void ListViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var product = ((ListViewItem)sender).Content as Product;
            NavigationService.Navigate(new AddEditProductPage(product, true));
        }

        private void historyButton_Click(object sender, RoutedEventArgs e)
        {
            Product pr = ProductsListView.SelectedItem as Product;
            if (pr != null)
            {
                NavigationService.Navigate(new SalesHistoryPage(pr));
            }
            else
            {
                NavigationService.Navigate(new SalesHistoryPage(null));
            }
        }
    }
    public class ItemsDataTemplateSelector : DataTemplateSelector
    {
        public DataTemplate FirstItem { get; set; }
        public DataTemplate OtherItem { get; set; }

        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            var itemsControl = ItemsControl.ItemsControlFromItemContainer(container);
            if(itemsControl.ItemContainerGenerator.IndexFromContainer(container) == 0)
            {
                return itemsControl.FindResource("FirstImage") as DataTemplate;
            }
            else
            {
                return itemsControl.FindResource("OtherImage") as DataTemplate;
            }
        }
    }
}
