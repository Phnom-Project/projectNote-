```
- 1 Update Package.json
- 2 Handle outside click
- 3 OnSearch_KeyEnter
- 4 Add event on custom component
- 5 File upload (upload and read json file)
```
### 1 Update Package.json
```ps1
# compare current version to last version
npm outdated
# You can update all dependencies to the "wanted version"
npm update
# update individual dependencies by specifying its name
npm update [packageName]
```
### 2 Handle outside click
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
### 3 OnSearch_KeyEnter
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
### 4 Add event on custom component
- page.tsx
```tsx
// function
  const handleAdd = (label: string) => {
    console.log("jsonAdd")
    setJsonArr([...jsonArr, label])
  }
...
<Picture_Json_Highlight key={idx} json={x.label} onClick={handleAdd} />
```
- component.tsx
```tsx
interface ButtonProps {
    json: string;
    onClick: (label: string) => void;
}
export function Picture_Json_Highlight({ json, onClick }: ButtonProps) {
    return (
        <div
            className="flex flex-row items-center gap-2
                        text-black font-bold underline underline-offset-8 decoration-cyan-600 hover:text-cyan-700 py-1 cursor-pointer"
            onClick={() => onClick(json)}
        >
            <Sparkle className="h-3 w-3" />
            {json.trim()}
        </div>
    )
}
```
### 5 File upload
```tsx
import { ChangeEvent, useEffect, useRef, useState } from "react";
...
// ref
const fileRef = useRef<HTMLInputElement>(null);
// function
function readFile(event: ChangeEvent<HTMLInputElement>) {
    // read json from file browser 
    const fileReader = new FileReader();
    const { files } = event.target;
    try {
        if (files) {
            fileReader.readAsText(files[0], "UTF-8");
            fileReader.onload = e => {
                if (e.target) {
                    const content = e.target.result;
                    // validate json
                }
            };
        }
    } catch (e) {
        console.error("Error reading file");
    }
};
....
<div className="flex flex-row items-center border rounded-md px-4 hover:bg-slate-100"
    onClick={() => {
        if (fileRef.current) {
            fileRef.current.click();
        }
    }}>
    <Label className="text-xs" >Import</Label>
    <Upload className="w-3 h-3 ml-2" />
    <Input ref={fileRef} id="json" type="file" onChange={(e) => {
        readFile(e)
    }} className="hidden" />
</div>
```
