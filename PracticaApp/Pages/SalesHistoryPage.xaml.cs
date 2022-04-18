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
    /// Interaction logic for SalesHistoryPage.xaml
    /// </summary>
    public partial class SalesHistoryPage : Page
    {
        public Product newProduct;
        public static List<ProductSale> productSales = new List<ProductSale>();
        public static List<string> products=new List<string>();
        public SalesHistoryPage(Product product)
        {
            InitializeComponent();
            newProduct = product;

            products.Add("Все товары");
            foreach (Product product1 in MainWindow.ent.Product.ToList())
            {
                if (product1 != null)
                {
                    products.Add(product1.Title);
                }
            }
            ProductCB.ItemsSource = products;
            if (newProduct != null)
            {
                ProductCB.SelectedItem = newProduct.Title;
                productSales = MainWindow.ent.ProductSale.Where(c=>c.ProductID==newProduct.ID).ToList();
            }
            else
            {
                productSales = MainWindow.ent.ProductSale.ToList();
            }
            SetProducts(productSales);
            SortAscDescCB.Visibility = Visibility.Hidden;
            SearchName.Visibility = Visibility.Hidden;
            AddRelatedBtn.Visibility = Visibility.Hidden;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ProductCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Filter();
        }
        private void SetProducts(List<ProductSale> newProducts)
        {
            productSales = newProducts;
            ProductSalesHistory.ItemsSource = productSales;
        }

        private void Filter()
        {
            //if (SearchName.Text != "" && ProductCB.SelectedItem != null)
            //{
            //    if (ProductCB.SelectedItem.ToString() == "Все производители")
            //    {
            //        SetProducts(MainWindow.ent.ProductSale.Where(c => c.Title.StartsWith(SearchName.Text)).ToList());
            //    }
            //    else
            //    {
            //        SetProducts(MainWindow.ent.ProductSale.Where(c => c.Title.StartsWith(SearchName.Text) && c.ManufacturerID
            //                   == ProductCB.SelectedIndex).ToList());
            //    }
            //}
            //else if (SearchName.Text != "")
            //{
            //    SetProducts(MainWindow.ent.ProductSale.Where(c => c.Title.StartsWith(SearchName.Text)).ToList());
            //}
            //else
            if (ProductCB.SelectedIndex != -1)
            {
                if (ProductCB.SelectedItem.ToString() == "Все товары")
                {
                    SetProducts(MainWindow.ent.ProductSale.ToList());
                }
                else
                {
                    SetProducts(MainWindow.ent.ProductSale.Where(c => c.ProductID == ProductCB.SelectedIndex).ToList());
                }
            }
        }
    }
}
