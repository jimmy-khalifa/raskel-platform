import React from 'react'
//import { Link } from 'gatsby'
import icon1 from '../../assets/images/icons/icon1.png'
import icon2 from '../../assets/images/icons/icon2.png'
import icon3 from '../../assets/images/icons/icon3.png'
import shape2 from '../../assets/images/services/service-shape2.png'
import { useIntl } from "react-intl"
import { LocalizedLink as Link } from "gatsby-theme-i18n"

const FeaturedService = () => {
    const intl = useIntl()
    return (
        <div className="boxes-area pb-70">
            <div className="container">
                <div className="row">
                    <div className="col-lg-4 col-md-6 col-sm-6">
                        <div className="single-boxes-item">
                            <div className="icon">
                                <img src={icon1} alt="banner" />
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "dtanalytics" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "dtanalyticstxt" })}{" "}</p>

                            <Link to="/contact" className="default-btn">
                                <i className="flaticon-right"></i> 
                                {intl.formatMessage({ id: "learnmore" })}{" "} <span></span>
                            </Link>

                            <div className="shape1">
                                <img src={shape2} alt="banner" />
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 col-sm-6">
                        <div className="single-boxes-item">
                            <div className="icon">
                                <img src={icon3} alt="banner" />
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "dtpolicy" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "dtpolicytxt" })}{" "}</p>
                            
                            <Link to="/contact" className="default-btn">
                                <i className="flaticon-right"></i> 
                                {intl.formatMessage({ id: "learnmore" })}{" "} <span></span>
                            </Link>

                            <div className="shape1">
                                <img src={shape2} alt="banner" />
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 col-sm-6 offset-lg-0 offset-sm-3 offset-md-3">
                        <div className="single-boxes-item">
                            <div className="icon">
                                <img src={icon2} alt="banner" />
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "dtstrategy" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "dtstrategytxt" })}{" "}</p>
                            
                            <Link to="/contact" className="default-btn">
                                <i className="flaticon-right"></i> 
                                {intl.formatMessage({ id: "learnmore" })}{" "} <span></span>
                            </Link>

                            <div className="shape1">
                                <img src={shape2} alt="banner" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default FeaturedService