import React from 'react'
//import { Link } from 'gatsby'
import img10 from '../../assets/images/about/about-img10.png'
import shape1 from '../../assets/images/about/about-shape1.png'
import shape2 from '../../assets/images/our-mission/our-mission-shape2.png'
import starIcon from '../../assets/images/star-icon.png'
import { useIntl } from "react-intl"
import { LocalizedLink as Link } from "gatsby-theme-i18n"

const AboutUs = () => {
    const intl = useIntl()

    return (
        <div className="about-area pb-100">
            <div className="container-fluid">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="about-img">
                            <img src={img10} alt="banner" />
                            <div className="shape">
                                <img src={shape1} alt="banner" />
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <div className="about-content">
                            <div className="content">
                                <span className="sub-title">
                                    <img src={starIcon} alt="banner" /> 
                                    {intl.formatMessage({ id: "digitaltransformation" })}{" "}
                                </span>
                                <h2>{intl.formatMessage({ id: "dtdomains" })}{" "}</h2>
                                <p>{intl.formatMessage({ id: "dtdomainstxt" })}{" "}</p>
                                <ul className="about-list">
                                    <li>
                                        <i className="flaticon-tick"></i>
                                        {intl.formatMessage({ id: "dtcustomers" })}{" "}
                                        <img src={shape2} alt="banner" />
                                    </li>
                                    <li>
                                        <i className="flaticon-tick"></i>
                                        {intl.formatMessage({ id: "dtvalue" })}{" "}
                                        <img src={shape2} alt="banner" />
                                    </li>
                                    <li>
                                        <i className="flaticon-tick"></i>
                                        {intl.formatMessage({ id: "dtcompetition" })}{" "}
                                        <img src={shape2} alt="banner" />
                                    </li>
                                    <li>
                                        <i className="flaticon-tick"></i>
                                        {intl.formatMessage({ id: "dtinnovation" })}{" "}
                                        <img src={shape2} alt="banner" />
                                    </li>
                                    <li>
                                        <i className="flaticon-tick"></i>
                                        {intl.formatMessage({ id: "dtdata" })}{" "}
                                        <img src={shape2} alt="banner" />
                                    </li>
                                    {/*<li>
                                        <i className="flaticon-tick"></i>
                                        Business Intelligence
                                        <img src={shape2} alt="banner" />
                                    </li>*/}
                                </ul>
                                <p>{intl.formatMessage({ id: "dtdomainstxttwo" })}{" "}</p>
                                <Link to="/about-us" className="default-btn">
                                    <i className="flaticon-right"></i> 
                                    {intl.formatMessage({ id: "aboutus" })}{" "} <span></span>
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default AboutUs