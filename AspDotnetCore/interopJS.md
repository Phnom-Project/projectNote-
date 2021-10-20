### element reference
> wwwroot/{}.js
```js
window.js = {
    method2: function (element) {
        OnNew(element);
    }
}
function OnNew(element) {
    var _text = document
        .createTextNode("Hello workkk.");
    element.appendChild(_text);}
```
> index.razor
```razor
<h1 @ref=MyElementReference2>Hello, world!</h1>

@code{
ElementReference MyElementReference2;
private async void ButtonClicked()
    {
        await js.InvokeVoidAsync("js.method2", MyElementReference2);
    }}
```
