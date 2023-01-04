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
