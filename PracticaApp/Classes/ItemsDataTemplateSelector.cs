using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;


namespace PracticaApp.Classes
{
    public class ItemsDataTemplateSelector:DataTemplateSelector
    {
        public DataTemplate FirstItem { get; set; }
        public DataTemplate OtherItem { get; set; }

        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            var itemsControl = ItemsControl.ItemsControlFromItemContainer(container);
            if (itemsControl != null)
            {
                return (itemsControl.ItemContainerGenerator.IndexFromContainer(container) == 0) ? FirstItem : OtherItem;
            }
            else
            {
                return FirstItem;
            }
        }
    }
}
