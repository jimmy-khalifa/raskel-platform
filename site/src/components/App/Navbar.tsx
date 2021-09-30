import React, { useContext, useState } from "react";
import { useRecoilState } from "recoil";
import { collapsedState } from "../../utils/recoil-atoms";
//import {Link} from 'gatsby'
import logo from "../../assets/images/logo.png";
import { LocalizedLink as Link, useLocalization } from "gatsby-theme-i18n";
import { useIntl } from "react-intl";

const Navbar = () => {
  const [collapsed, setCollapsed] = useRecoilState(collapsedState);
  const { config } = useLocalization();
  const intl = useIntl();

  const toggleNavbar = () => {
    setCollapsed(!collapsed);
  };

  React.useEffect(() => {
    let elementId = document.getElementById("navbar");
    document.addEventListener("scroll", () => {
      if (window.scrollY > 170) {
        elementId.classList.add("is-sticky");
      } else {
        elementId.classList.remove("is-sticky");
      }
    });

    //window.scrollTo(0, 0)
  });

  const classOne = collapsed
    ? "collapse navbar-collapse"
    : "collapse navbar-collapse show";
  const classTwo = collapsed
    ? "navbar-toggler navbar-toggler-right collapsed"
    : "navbar-toggler navbar-toggler-right";

  return (
    <React.Fragment>
      <div id="navbar" className="navbar-area">
        <div className="tarn-nav">
          <div className="container-fluid">
            <nav className="navbar navbar-expand-lg navbar-light">
              <Link
                to="/"
                onClick={() => setCollapsed(true)}
                className="navbar-brand"
              >
                <img src={logo} alt="logo" />
              </Link>

              <button
                onClick={toggleNavbar}
                className={classTwo}
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
              >
                <span className="icon-bar top-bar"></span>
                <span className="icon-bar middle-bar"></span>
                <span className="icon-bar bottom-bar"></span>
              </button>

              <div className={classOne} id="navbarSupportedContent">
                <ul className="navbar-nav">
                  <li className="nav-item">
                    <Link to="/#" activeClassName="active" className="nav-link">
                      {intl.formatMessage({ id: "home" })}{" "}
                    </Link>
                  </li>

                  <li className="nav-item">
                    <Link
                      to="/#platform"
                      activeClassName="active"
                      className="nav-link"
                    >
                      {intl.formatMessage({ id: "theplatform" })}{" "}
                    </Link>
                  </li>

                  <li className="nav-item">
                    <Link
                      to="/#services"
                      activeClassName="active"
                      className="nav-link"
                    >
                      {intl.formatMessage({ id: "services" })}{" "}
                    </Link>
                  </li>
                  <li className="nav-item">
                    <Link
                      to="/#team"
                      activeClassName="active"
                      className="nav-link"
                    >
                      {intl.formatMessage({ id: "theteam" })}{" "}
                    </Link>
                  </li>

                  <li className="nav-item">
                    <Link
                      to="/#contact"
                      activeClassName="active"
                      onClick={() => setCollapsed(true)}
                      className="nav-link"
                    >
                      {intl.formatMessage({ id: "contact" })}{" "}
                    </Link>
                  </li>
                  <li className="nav-item">
                    <Link to="#" activeClassName="active" className="nav-link">
                      <i className="bx bx-world"></i>
                    </Link>

                    <ul
                      className="dropdown-menu"
                      style={{ width: 150 }}
                      key="lang-ul"
                    >
                      {config.map((locale: any) => (
                        <React.Fragment key={"lang-" + locale.code}>
                          <li className="nav-item">
                            <Link
                              to="/#"
                              language={locale.code}
                              activeClassName="active"
                              onClick={() => {
                                setCollapsed(true);
                              }}
                              className="nav-link"
                            >
                              {locale.localName}
                            </Link>
                          </li>
                        </React.Fragment>
                      ))}
                    </ul>
                  </li>
                </ul>

                <div className="others-option d-flex align-items-center">
                  <div className="option-item">
                    <Link
                      to="/#contact"
                      activeClassName="active"
                      onClick={() => setCollapsed(true)}
                      className="default-btn"
                    >
                      <i className="flaticon-right"></i>
                      {intl.formatMessage({ id: "getintouch" })} <span></span>
                    </Link>
                  </div>
                </div>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </React.Fragment>
  );
};

export default Navbar;
