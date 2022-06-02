### Custom Attribute
> CustomAttribute.cs
```cs
namespace CustomAttribute
{
    [AttributeUsage(AttributeTargets.All)]
    public class DeveloperAttribute : Attribute
    {
        // Private fields.
        private string name;
        private string level;
        private bool reviewed;
        // This constructor defines two required parameters: name and level.
        public DeveloperAttribute(string name, string level)
        {
            this.name = name;
            this.level = level;
            this.reviewed = false;
        }
        // Define Name property.
        // This is a read-only attribute.
        public virtual string Name
        {
            get { return name; }
        }
        // Define Level property.
        // This is a read-only attribute.
        public virtual string Level
        {
            get { return level; }
        }
        // Define Reviewed property.
        // This is a read/write attribute.
        public virtual bool Reviewed
        {
            get { return reviewed; }
            set { reviewed = value; }
        }
    }
}
```
> Developer.cs
```cs
namespace CustomAttribute
{
    [Developer("Joan Smith", "42", Reviewed = true)]
    public class Developer
    {
        public static void MainApp()
        {
            GetAttributes(typeof(Developer));
        }
        public static void GetAttributes(Type T)
        {
            DeveloperAttribute MyAttribute =
                // (DeveloperAttribute)Attribute.GetCustomAttribute<DeveloperAttribute>(T, typeof(DeveloperAttribute));
                (DeveloperAttribute) Attribute.GetCustomAttribute(T, typeof (DeveloperAttribute));

            if (MyAttribute == null)
            {
                Console.WriteLine("The attribute was not found.");
            }
            else
            {
                // Get the Name value.
                Console.WriteLine("The Name Attribute is: {0}.", MyAttribute.Name);
                // Get the Level value.
                Console.WriteLine("The Level Attribute is: {0}.", MyAttribute.Level);
                // Get the Reviewed value.
                Console.WriteLine("The Reviewed Attribute is: {0}.", MyAttribute.Reviewed);
            }
        }
    }
}
```
> Program.cs
```cs
// See https://aka.ms/new-console-template for more information
using CustomAttribute;
Console.WriteLine("Hello, World!");
Developer.MainApp();
```
