import { extendTheme } from "native-base";
import { DefaultTheme } from '@react-navigation/native';

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
  fontConfig: {
    Roboto: {
      100: {
        normal: "Roboto-Light",
        italic: "Roboto-LightItalic",
      },
      200: {
        normal: "Roboto-Light",
        italic: "Roboto-LightItalic",
      },
      300: {
        normal: "Roboto-Light",
        italic: "Roboto-LightItalic",
      },
      400: {
        normal: "Roboto-Regular",
        italic: "Roboto-Italic",
      },
      500: {
        normal: "Roboto-Medium",
      },
      600: {
        normal: "Roboto-Medium",
        italic: "Roboto-MediumItalic",
      },
    },
    ArslanWessam: {
      100: {
        normal: "ArslanWessam",
        size: 36,
      },
      200: {
        normal: "ArslanWessam",
        size: 48,
      },
      300: {
        normal: "ArslanWessam",
        size: 56,
      },
      400: {
        normal: "ArslanWessam",
        size: 64,
      },
      500: {
        normal: "ArslanWessam",
        size: 72,
      },
      600: {
        normal: "ArslanWessam",
        size: 90,
      },
    },
  },
  // Make sure values below matches any of the keys in `fontConfig`
  fonts: {
    heading: "ArslanWessam",
    body: "ArslanWessam",
    mono: "ArslanWessam",
  },
});

export const navigatorTheme = {
    ...DefaultTheme,
    dark: false,
    colors: {
        primary: "#00f183",
        background: "#00f183",
        card: "#393e41",
        text: "#00f183",
        border: "#00f183",
        notification: "#393e41",
    },
  };
export default theme;
