using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Interaction logic for AddEditProductPage.xaml
    /// </summary>
    public partial class AddEditProductPage : Page
    {
        Product product;
        List<Product> attachedProducts = new List<Product>();
        List<ProductPhoto> attachedImages = new List<ProductPhoto>();
        string mainPath = "";
        public AddEditProductPage(Product newProduct, bool IsEdit)
        {
            InitializeComponent();
            product = newProduct;
            DataContext = product;
            if(product != null)
            {
                attachedProducts = product.Product1.ToList();
                attachedImages = MainWindow.ent.ProductPhoto.Where(c => c.ProductID == product.ID).ToList();
                SetAttachedImages();
            }
            else
            {
                AddRelatedbtn.Visibility = Visibility.Hidden;
            }
           
            manufacturersCB.ItemsSource = MainWindow.ent.Manufacturer.ToList();
            RelatedProducts.ItemsSource = attachedProducts;
            CheckVisibility();
            if (IsEdit)
            {
                idlb.Visibility = Visibility.Visible;
                idtb.Visibility = Visibility.Visible;
            }
            else
            {
                idlb.Visibility = Visibility.Hidden;
                idlb.Height = 0;
                idtb.Visibility = Visibility.Hidden;
                idtb.Height = 0;
                RelatedImagesStackPanel.Visibility = Visibility.Hidden;
                RelatedImagesStackPanel.Height = 0;
                productImageButton.Visibility = Visibility.Hidden;
                productImageButton.Height = 0;
                Add_Image.Visibility = Visibility.Hidden;
                Add_Image.Height = 0;
            }
        }
        private void SetAttachedImages()
        {
            attachedImages = product.ProductPhoto.ToList();
            RelatedImages.ItemsSource = attachedImages;
        }
        private void CheckVisibility()
        {
            if (RelatedProducts.Items.Count == 0)
            {
                relatedProductsLabel.Visibility = Visibility.Hidden;
                relatedProductsLabel.Height = 0;
                relatedProductsLabel.Width = 0;
                //AddRelatedbtn.Visibility = Visibility.Hidden;
                //AddRelatedbtn.Height = 0;
                //AddRelatedbtn.Width = 0;
                DelRelatedbtn.Visibility = Visibility.Hidden;
                DelRelatedbtn.Height = 0;
                DelRelatedbtn.Width = 0;
            }
        }

        private void Backbtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductPage());
        }

        private void Savebtn_Click(object sender, RoutedEventArgs e)
        {
            if (ProductNametb.Text.Length > 0 && DescriptionTB.Text.Length > 0 && manufacturersCB.SelectedItem != null)
            {
                if (product == null)
                {
                    Product product1 = new Product();
                    product1.Title = ProductNametb.Text;
                    product1.Description = DescriptionTB.Text;
                    product1.Manufacturer = manufacturersCB.SelectedItem as Manufacturer;
                    MainWindow.ent.Product.Add(product1);
                }

                MainWindow.ent.SaveChanges();
                NavigationService.Navigate(new ProductPage());
            }
            else
            {
                MessageBox.Show("Вы ввели не все данные!");
            }
        }
        private void SetAttachedProducts()
        {
            attachedProducts = product.Product1.ToList();
            RelatedProducts.ItemsSource = attachedProducts;
        }

        private void ListViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var product = ((ListViewItem)sender).Content as Product;
            NavigationService.Navigate(new AddEditProductPage(product, true));
        }

        private void AddRelatedbtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddRelatedProductPage(product));
        }

        private void DelRelatedbtn_Click(object sender, RoutedEventArgs e)
        {
            Product pr = RelatedProducts.SelectedItem as Product;
            if (pr != null)
            {
                var result = MessageBox.Show("Вы хотите удалить?", "Yes or No", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    MessageBox.Show("Продукт удален!");
                    product.Product1.Remove(pr);
                    MainWindow.ent.SaveChanges();
                    RelatedProducts.ItemsSource = attachedProducts;
                    SetAttachedProducts();
                    CheckVisibility();
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

        private void Add_Image_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            string folderpath = System.IO.Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "\\Images\\";
            op.Title = "Select a picture";
            op.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
                        "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
                        "Portable Network Graphic (*.png)|*.png";

            bool? myResult;
            myResult = op.ShowDialog();
            if (myResult != null && myResult == true)
            {
                productImageButton.Source = new BitmapImage(new Uri(op.FileName));
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                string filePath = folderpath + System.IO.Path.GetFileName(op.FileName);
                
               
                ProductPhoto pp = MainWindow.ent.ProductPhoto.Where(c => c.ProductID == product.ID && c.PhotoPath == product.MainImagePath).FirstOrDefault();
                if (pp != null)
                {
                    MainWindow.ent.ProductPhoto.Remove(pp);
                }
                
                product.MainImagePath = filePath;
                ProductPhoto productPhoto = new ProductPhoto();
                productPhoto.ProductID = product.ID;
                productPhoto.PhotoPath = filePath;
                MainWindow.ent.ProductPhoto.Add(productPhoto);
                SetAttachedImages();
                CheckVisibility();
                //product.MainImagePath = filePath.Substring(filePath.LastIndexOf("/Images"));
            }
        }

        private void AddRelatedImagebtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            string folderpath = System.IO.Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "\\Images\\";
            op.Title = "Select a picture";
            op.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
                        "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
                        "Portable Network Graphic (*.png)|*.png";

            bool? myResult;
            myResult = op.ShowDialog();
            if (myResult != null && myResult == true)
            {
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                string filePath = folderpath + System.IO.Path.GetFileName(op.FileName);

                mainPath = mainPath.Replace(@"\"[0], '/');
                ProductPhoto productPhoto = new ProductPhoto();
                productPhoto.PhotoPath = filePath;
                productPhoto.ProductID = product.ID;
                product.ProductPhoto.Add(productPhoto);
                SetAttachedImages();
                CheckVisibility();
                //product.MainImagePath = filePath.Substring(filePath.LastIndexOf("/Images"));
            }
        }

        private void DelRelatedImagebtn_Click(object sender, RoutedEventArgs e)
        {
            ProductPhoto pr = RelatedImages.SelectedItem as ProductPhoto;
            ProductPhoto productPhoto = MainWindow.ent.ProductPhoto.Where(c => c.ID == pr.ID).FirstOrDefault();
            if (pr.ID == productPhoto.ID)
            {
                if (pr != null)
                {
                    var result = MessageBox.Show("Вы хотите удалить?", "Yes or No", MessageBoxButton.YesNo);
                    if (result == MessageBoxResult.Yes)
                    {

                        MainWindow.ent.ProductPhoto.Remove(pr);
                        MainWindow.ent.SaveChanges();
                        SetAttachedImages();
                        CheckVisibility();
                        MessageBox.Show("изображение удалено!");
                    }
                    else
                    {
                        MessageBox.Show("Операция отменена");
                    }
                }
                else
                {
                    MessageBox.Show("Выберите изображение");
                }
            }
            else
            {
                MessageBox.Show("Нельзя удалить главное изображение");
            }
        }
    }
}
