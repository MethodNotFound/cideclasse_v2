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
              "primary": "#3a31d8",
              "secondary": "#020024",
              "accent": "#0600c2",
              "neutral": "#331800",
              "neutral-content": "#FFE7A3",
              "base-100": "#04030f",
              "base-200": "#010104",
              "base-300": "#04040A",
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
