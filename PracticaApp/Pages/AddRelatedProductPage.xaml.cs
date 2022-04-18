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
    /// Interaction logic for AddRelatedProductPage.xaml
    /// </summary>
    public partial class AddRelatedProductPage : Page
    {
        public static List<Product> products;
        public static Product newProduct;
        public static List<Product> notRelatedProducts;
        public AddRelatedProductPage(Product product)
        {
            InitializeComponent();
            newProduct = product;
            DataContext = newProduct;

            products = MainWindow.ent.Product.Where(c => c.IsActive == true&&c.ID!=newProduct.ID).ToList();
            //foreach(Product product1 in products)
            //{
            //    foreach(Product pr in newProduct.Product1)
            //    {
            //        if (product.ID != pr.ID)
            //        {
            //            notRelatedProducts.Add(pr);
            //        }
            //    }
            //}
            ProductsListView.ItemsSource = products;
        }

        private void AddRelatedBtn_Click(object sender, RoutedEventArgs e)
        {
            Product selectedProduct = ProductsListView.SelectedItem as Product;
            if (selectedProduct != null)
            {
                newProduct.Product1.Add(selectedProduct);
                MessageBox.Show("Продукт добавлен!");
                MainWindow.ent.SaveChanges();
                NavigationService.Navigate(new AddEditProductPage(newProduct, true));
            }
            else
            {
                MessageBox.Show("Продукт не выбран!");
            }
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditProductPage(newProduct, true));
        }
    }
}
