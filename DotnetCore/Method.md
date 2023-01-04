### Extension Method
```cs
namespace ExtensionMethods
{
    public static class IntExtensions
    {
        public static bool IsGreaterThan(this int i, int value)
        {
            return i > value;
        }
    }
}
namespace Con
{
    using ExtensionMethods;

    class Program
    {
        static void Main(string[] args)
        {
            int i = 10;

            bool result = i.IsGreaterThan(100);

            Console.WriteLine(result);
        }
    }
}

```
>on cosole : false
#### with lamda expression as parameter
``` cs
namespace ExtensionMethods
{
    public static class IntExtensions
    {
        public static bool IsGreaterThan(this int i, Func<int> value)
        {
            var x = value();
            return i > x;
        }
    }
}
namespace Con
{
    using ExtensionMethods;

    class Program
    {
        static void Main(string[] args)
        {
            int i = 10;

            bool result = i.IsGreaterThan(()=>{
                return 2;
            });
            //bool result = i.IsGreaterThan(()=>2);

            Console.WriteLine(result);
        }
    }
}
```
