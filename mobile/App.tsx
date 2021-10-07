import React from "react";
import { Button, NativeBaseProvider, Box } from "native-base";

import theme  from "./src/theme";

export default function App() {
  return (
    <NativeBaseProvider theme={theme}>
      <Box>
        <Button
          color="secondary.700"
          onPress={() => console.log("hello world")}
        >
          Primary
        </Button>
      </Box>
    </NativeBaseProvider>
  );
}
