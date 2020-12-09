import { createAppContainer, createSwitchNavigator } from "react-navigation";

import Login1 from "./pages/Login1";
import Login2 from "./pages/Login2";
import Commits from "./pages/Commits";
import Repositories from "./pages/Repositories";

const Routes = createAppContainer(
  createSwitchNavigator({
    Login1,
    Login2,
    Commits,
    Repositories
  })
);

export default Routes;
