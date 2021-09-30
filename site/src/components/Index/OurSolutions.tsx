import React from 'react'
import {Link} from 'gatsby'
import starIcon from '../../assets/images/star-icon.png'
import { useIntl } from "react-intl"

const OurSolutions = () => {
    const intl = useIntl()
    return (
        <section id="platform" className="solutions-area pb-70">
            <div className="container">
                <div className="section-title">
                    <span className="sub-title">
                        <img src={starIcon} alt="star" /> 
                        {intl.formatMessage({ id: "theplatform" })}{" "}
                    </span>
                    <h2>{intl.formatMessage({ id: "theplatformmsg" })}{" "}</h2>
                    <p>{intl.formatMessage({ id: "theplatformtxt" })}{" "}</p>
                </div>

                <div className="row">
                    <div className="col-lg-4 col-sm-6">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-team"></i>
                            </div>
                            <h3>
                                <Link to="#">
                                {intl.formatMessage({ id: "customers" })}{" "}
                                </Link>
                            </h3>
                            <p>{intl.formatMessage({ id: "customersmsg" })}{" "}</p>
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-investment"></i>
                            </div>

                            <h3>
                                <Link to="#">
                                {intl.formatMessage({ id: "competition" })}{" "}
                                </Link>
                            </h3>

                            <p>{intl.formatMessage({ id: "competitionmsg" })}{" "}</p>
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-analytics"></i>
                            </div>

                            <h3>
                                <Link to="/#">
                                {intl.formatMessage({ id: "data" })}{" "}
                                </Link>
                            </h3> 

                            <p>{intl.formatMessage({ id: "datamsg" })}{" "}</p>
                            
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-rocket"></i>
                            </div>

                            <h3>
                                <Link to="#">
                                {intl.formatMessage({ id: "innovation" })}{" "}
                                </Link>
                            </h3> 

                            <p>{intl.formatMessage({ id: "innovationmsg" })}{" "}</p>
                            
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-money"></i>
                            </div>

                            <h3>
                                <Link to="/service-details">
                                {intl.formatMessage({ id: "value" })}{" "}
                                </Link>
                            </h3> 

                            <p>{intl.formatMessage({ id: "valuemsg" })}{" "}</p>
                            
                            {/*<Link to="/service-details" className="view-details-btn">
                                View Details
                            </Link>*/}
                        </div>
                    </div>

                    <div className="col-lg-4 col-sm-6 offset-lg-0 offset-sm-3">
                        <div className="single-solutions-box">
                            <div className="icon">
                                <i className="flaticon-idea"></i>
                            </div>

                            <h3>
                                <Link to="/service-details">
                                {intl.formatMessage({ id: "disruption" })}{" "}
                                </Link>
                            </h3> 

                            <p>{intl.formatMessage({ id: "disruptionmsg" })}{" "}</p>
                            
                            {/*<Link to="/service-details" className="view-details-btn">
                                View Details
                            </Link>*/}
                        </div>
                    </div>

                </div>
            </div>
        </section>
    )
}

export default OurSolutions;