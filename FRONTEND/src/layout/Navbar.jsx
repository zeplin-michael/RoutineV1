import { NavLink } from "react-router";

import { useAuth } from "../auth/AuthContext";

export default function Navbar() {
  const { token, logout } = useAuth();
  return (
    <header id="navbar">
      <nav>
        <div className="brand">
          <NavLink id="brand" to="/">
            Athletis
          </NavLink>
        </div>
        <div className="additional links">
          <NavLink to="/about">About</NavLink>

          <NavLink to="/features">Features</NavLink>
          {token ? (
            <button onClick={logout}>Log out</button>
          ) : (
            <NavLink to="/login">Log in</NavLink>
          )}
        </div>
      </nav>
    </header>
  );
}
