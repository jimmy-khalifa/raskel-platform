import { extendTheme } from "native-base";

const theme = extendTheme({
  colors: {
    primary: {
      50: "#dafff0",
      100: "#adffda",
      200: "#7cffc4",
      300: "#4affad",
      400: "#1aff97",
      500: "#00e67d",
      600: "#00b360",
      700: "#008045",
      800: "#004e28",
      900: "#001c09",
    },
    secondary: {
      50: "#ebf3fb",
      100: "#d4d9dd",
      200: "#bbc0c3",
      300: "#a1a7ab",
      400: "#878e92",
      500: "#6e7578",
      600: "#545b5e",
      700: "#3c4144",
      800: "#22272b",
      900: "#050e15",
    },
  },
  components: {
    Button: {
      baseStyle: {
        color: "secondary.700",
      },
      defaultProps: {
        color: "secondary.700",
      },
      variants: {},
      sizes: {},
    },
  },
});

export default theme;
