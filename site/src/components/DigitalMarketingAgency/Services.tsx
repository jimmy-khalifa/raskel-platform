import React from 'react'
import service4 from '../../assets/images/services/service4.png'
import service5 from '../../assets/images/services/service5.png'
import service6 from '../../assets/images/services/service6.png'
import { useIntl } from "react-intl"

const Services = () => {
    const intl = useIntl()
    return (
        <section className="overview-area ptb-100 pt-0">
            <div className="container">
                {/* Left Image Style */}
                <div className="overview-box">
                    <div className="overview-image">
                        <div className="image">
                            <img src={service4} alt="features" />
                        </div>
                    </div>
                    
                    <div className="overview-content">
                        <div className="content right-content">
                            <span className="sub-title">{intl.formatMessage({ id: "designanddev" })}{" "}</span>
                            <h2>{intl.formatMessage({ id: "solvingproblems" })}{" "}</h2>
                            <p>{intl.formatMessage({ id: "solvingproblemstxt" })}{" "}</p>

                            <ul className="features-list">
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "branding" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "graphdesign" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "webdesigntwo" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "uxdesigntwo" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "dedicateddev" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "supporttwo" })}{" "}</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                {/* End Left Image Style */}

                {/* Right Image Style */}
                <div className="overview-box">
                    <div className="overview-content">
                        <div className="content">
                            <span className="sub-title">{intl.formatMessage({ id: "socialmediamarket" })}{" "}</span>
                            <h2>{intl.formatMessage({ id: "socialmediamarkettitle" })}{" "}</h2>
                            <p>{intl.formatMessage({ id: "socialmediamarkettxt" })}{" "}</p>

                            <div className="features-text">
                                <h4><i className="flaticon-tick"></i>{intl.formatMessage({ id: "coredev" })}{" "}</h4>
                                <p>{intl.formatMessage({ id: "coredevtxt" })}{" "}</p>
                            </div>

                            <div className="features-text">
                                <h4><i className="flaticon-tick"></i>{intl.formatMessage({ id: "choices" })}{" "}</h4>
                                <p>{intl.formatMessage({ id: "choicestxt" })}{" "}</p>
                            </div>
                        </div>
                    </div>

                    <div className="overview-image">
                        <div className="image">
                            <img src={service5} alt="features" />
                        </div>
                    </div>
                </div>
                {/* End Right Image Style */}

                {/* Left Image Style */}
                <div className="overview-box">
                    <div className="overview-image">
                        <div className="image">
                            <img src={service6} alt="features" />
                        </div>
                    </div>
                    
                    <div className="overview-content">
                        <div className="content right-content">
                            <span className="sub-title">{intl.formatMessage({ id: "seoconsult" })}{" "}</span>
                            <h2>{intl.formatMessage({ id: "wemake" })}{" "}</h2>
                            <p>{intl.formatMessage({ id: "wemaketxt" })}{" "}</p>

                            <ul className="features-list">
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seoanalysis" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seostrategy" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seoforecast" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seoprojectplan" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seokpi" })}{" "}</span></li>
                                <li><span><i className='bx bx-check'></i>{intl.formatMessage({ id: "seotimeline" })}{" "}</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                {/* End Left Image Style */}
            </div>
        </section>
    )
}

export default Services