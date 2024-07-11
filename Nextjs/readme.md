### Update Package.json
```ps1
# compare current version to last version
npm outdated
# You can update all dependencies to the "wanted version"
npm update
# update individual dependencies by specifying its name
npm update [packageName]
```
### Handle outside click
```ts
// State
const [isSuggestion, setIsSuggestion] = useState(false);
// Reference
const newRef = useRef<HTMLDivElement>(null);
// Function
const handleOutsideClick = (e: MouseEvent) => {
    if (newRef.current && !newRef.current.contains(e.target as Node)) {
        setIsSuggestion(false);
    }
};
```
### OnSearch_KeyEnter
```tsx
// Function
const onSearch_KeyEnter = <T,>(e: T) => {
    var event = e as KeyboardEvent;
    if (event.key === "Enter") {
        router.push(P_Redirect_Search({ q: searchPhrase }))
    }
}
// html
...
<Input onKeyDown={onSearch_KeyEnter}/>
```
