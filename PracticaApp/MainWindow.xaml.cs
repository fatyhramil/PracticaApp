using PracticaApp.Pages;
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

namespace PracticaApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static PracticaDBEntities ent = new PracticaDBEntities();
        public MainWindow()
        {
            InitializeComponent();
            Uri iconuri = new Uri("pack://application:,,,/beauty_logo.ico", UriKind.RelativeOrAbsolute);
            this.Icon = BitmapFrame.Create(iconuri);
            FrameMW.Navigate(new ProductPage());

        }
    }
}
