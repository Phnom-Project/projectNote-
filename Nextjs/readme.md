### Update Package.json
```ps1
# compare current version to last version
npm outdated
# You can update all dependencies to the "wanted version"
npm update
# update individual dependencies by specifying its name
npm update [packageName]
```
### handle outside click
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
