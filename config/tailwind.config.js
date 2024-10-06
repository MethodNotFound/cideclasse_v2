const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  daisyui: {
      themes: [
        {
          luxury: {
              "color-scheme": "dark",
              "primary": "#dca54c",
              "secondary": "#152747",
              "accent": "#513448",
              "neutral": "#331800",
              "neutral-content": "#FFE7A3",
              "base-100": "#454242",
              "base-200": "#171618",
              "base-300": "#2e2d2f",
              "base-content": "#cfcfcf",
              "info": "#66c6ff",
              "success": "#87d039",
              "warning": "#e2d562",
              "error": "#ff6f6f",
            },
        },
      ],
      styled: true,
      base: true,
      utils: true,
      logs: true,
      rtl: false,
      prefix: "",
      darkTheme: "luxury",
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require("daisyui"),
  ],
}
