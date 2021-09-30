import React from 'react'
import { Link } from 'gatsby'
import aboutImage from '../../assets/images/about/about-img5.png'
import starIcon from '../../assets/images/star-icon.png'
import icon4 from '../../assets/images/icons/icon4.png'
import icon5 from '../../assets/images/icons/icon5.png'
import icon6 from '../../assets/images/icons/icon6.png'
import icon7 from '../../assets/images/icons/icon7.png'
import shape1 from '../../assets/images/shape/circle-shape1.png'
import { useIntl } from "react-intl"
 
const AboutUsContent = () => {
    const intl = useIntl()
    return (
        <section className="about-area ptb-100">
            <div className="container-fluid">
                <div className="row align-items-center">
                    <div className="col-lg-6 col-md-12">
                        <div className="about-image">
                            <img src={aboutImage} alt="banner" />
                        </div>
                    </div>

                    <div className="col-lg-6 col-md-12">
                        <div className="about-content">
                            <div className="content">
                                <span className="sub-title">
                                    <img src={starIcon} alt="banner" /> 
                                    {intl.formatMessage({ id: "aboutus" })}{" "}
                                </span>
                                <h2>{intl.formatMessage({ id: "aboutcontent" })}{" "}</h2>
                                <p>{intl.formatMessage({ id: "aboutcontentmsg" })}{" "}</p>
                                
                                <ul className="features-list">
                                    <li>
                                        <img src={icon6} alt="banner" />
                                        <h3>{intl.formatMessage({ id: "aboutanalyse" })}{" "}</h3>
                                        <p>{intl.formatMessage({ id: "aboutanalysemsg" })}{" "}</p>
                                    </li>
                                    <li>
                                        <img src={icon5} alt="banner" />
                                        <h3>{intl.formatMessage({ id: "aboutdevelop" })}{" "}</h3>
                                        <p>{intl.formatMessage({ id: "aboutdevelopmsg" })}{" "}</p>
                                    </li>
                                    <li>
                                        <img src={icon4} alt="banner" />
                                        <h3>{intl.formatMessage({ id: "aboutbuild" })}{" "}</h3>
                                        <p>{intl.formatMessage({ id: "aboutbuildmsg" })}{" "}</p>
                                    </li>
                                    <li>
                                        <img src={icon7} alt="banner" />
                                        <h3>{intl.formatMessage({ id: "aboutimplement" })}{" "}</h3>
                                        <p>{intl.formatMessage({ id: "aboutimplementmsg" })}{" "}</p>
                                    </li>
                                </ul>
                                <p>{intl.formatMessage({ id: "aboutcontentmsgtwo" })}{" "}</p>
                                
                                <Link to="/about-us" className="default-btn">
                                    <i className="flaticon-right"></i>{intl.formatMessage({ id: "aboutmore" })}{" "}<span></span>
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="circle-shape1">
                <img src={shape1} alt="banner" />
            </div>

            <div className="container">
                <div className="about-inner-area">
                    <div className="row">
                        <div className="col-lg-4 col-md-6 col-sm-6">
                            <div className="about-text">
                                <h3>{intl.formatMessage({ id: "abouthistory" })}{" "}</h3>
                                <p>{intl.formatMessage({ id: "abouthistorymsg" })}{" "}</p>
                                
                                <ul className="features-list">
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "abouthistoryone" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "abouthistorytwo" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "abouthistorythree" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "abouthistoryfour" })}{" "}</li>
                                </ul>
                            </div>
                        </div>
    
                        <div className="col-lg-4 col-md-6 col-sm-6">
                            <div className="about-text">
                                <h3>{intl.formatMessage({ id: "aboutmission" })}{" "}</h3>
                                <p>{intl.formatMessage({ id: "aboutmissionmsg" })}{" "}</p>
                                
                                <ul className="features-list">
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutmissionone" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutmissiontwo" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutmissionthree" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutmissionfour" })}{" "}</li>
                                </ul>
                            </div>
                        </div>
    
                        <div className="col-lg-4 col-md-6 col-sm-6 offset-lg-0 offset-md-3 offset-sm-3">
                            <div className="about-text">
                                <h3>{intl.formatMessage({ id: "aboutweare" })}{" "}</h3>
                                <p>{intl.formatMessage({ id: "aboutwearemsg" })}{" "}</p>
                                
                                <ul className="features-list">
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutweareone" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutwearetwo" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutwearethree" })}{" "}</li>
                                    <li><i className="flaticon-tick"></i>{intl.formatMessage({ id: "aboutwearefour" })}{" "}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="circle-shape1">
                <img src={shape1} alt="banner" />
            </div>
        </section>
    )
}

export default AboutUsContent;