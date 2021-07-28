    -Areas
      -Todos
        -pages
        index.cshtml  **(https://localhost:5001/todos)
        -work
          -Account
            -login.cshtml **(add @page)(https://localhost:5001/todos/work/account/login)
    -Pages
    -Models
    -Data

<details>
  <summary>Including a new splash animation</summary>

1. Convert your animation to a `.gif` file.
   Ideally, use a background color of `0xFF030303` to ensure the animation
   blends into the background of the app.

2. Add your new `.gif` file to the assets directory under
   `assets/splash_effects`. Ensure the name follows the format
   `splash_effect_$num.gif`. The number should be the next number after the
   current largest number in the repository.

3. Update the map `_effectDurations` in
   [splash.dart](lib/pages/splash.dart) to include the number of the
   new `.gif` as well as its estimated duration. The duration is used to
   determine how long to display the splash animation at launch.
</details>
