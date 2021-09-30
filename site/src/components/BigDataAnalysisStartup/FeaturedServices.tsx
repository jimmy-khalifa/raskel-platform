import React from 'react';
//import {Link} from 'gatsby'
import { LocalizedLink as Link } from "gatsby-theme-i18n"
import { useIntl } from "react-intl"

const FeaturedServices = () => {
    const intl = useIntl()

    return (
        <section className="featured-services-area pt-100 pb-70">
            <div className="container">
                <div className="section-title">
                    <h2>{intl.formatMessage({ id: "takeyourbusiness" })}{" "}</h2>
                    <p>{intl.formatMessage({ id: "takeyourbusinessmsg" })}{" "}</p>
                </div>

                <div className="row">
                    <div className="col-lg-4 col-md-6 col-sm-6">
                        <div className="single-featured-services-box">
                            <div className="icon">
                                <i className="flaticon-analysis"></i>
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "analysedata" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "analysedatamsg" })}{" "}</p>

                            <Link to="/contact" className="read-more-btn">
                                <i className="flaticon-right"></i> {intl.formatMessage({ id: "getintouch" })}{" "}
                            </Link>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 col-sm-6">
                        <div className="single-featured-services-box">
                            <div className="icon">
                                <i className="flaticon-structure"></i>
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "developstrategy" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "developstrategymsg" })}{" "}</p>
                            
                            <Link to="/contact" className="read-more-btn">
                                <i className="flaticon-right"></i> {intl.formatMessage({ id: "getintouch" })}{" "}
                            </Link>
                        </div>
                    </div>

                    <div className="col-lg-4 col-md-6 col-sm-6 offset-lg-0 offset-md-3 offset-sm-3">
                        <div className="single-featured-services-box">
                            <div className="icon">
                                <i className="flaticon-idea"></i>
                            </div>
                            <h3>
                                {intl.formatMessage({ id: "implementsolution" })}{" "}
                            </h3>
                            <p>{intl.formatMessage({ id: "implementsolutionmsg" })}{" "}</p>
                            
                            <Link to="/contact" className="read-more-btn">
                                <i className="flaticon-right"></i> {intl.formatMessage({ id: "getintouch" })}{" "}
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default FeaturedServices;