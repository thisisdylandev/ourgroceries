const colors = require('tailwindcss/colors')

module.exports = {
  important: true,
  theme: {
    extend: {
      colors: {
        grey: colors.blueGray,
        yellow: colors.amber,
        green: colors.emerald,
        purple: colors.violet,
        white: colors.white
      },
    },
  },
  variants: {},
  plugins: [],
}