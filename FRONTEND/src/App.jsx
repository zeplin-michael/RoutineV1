import { Route, Routes } from "react-router";
import Home from "./pages/Home";
import Layout from "./layout/Layout";
import Login from "./auth/Login";
import Register from "./auth/Register";
import About from "./pages/About";
import Features from "./pages/Features";

export default function App() {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="/register" element={<Register />} />
        <Route path="/login" element={<Login />} />
        <Route path="/about" element={<About />} />
        <Route path="/features" element={<Features />} />
      </Route>
    </Routes>
  );
}
