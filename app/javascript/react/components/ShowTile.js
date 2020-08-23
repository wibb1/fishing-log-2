import React from 'react';
import { Link } from 'react-router-dom';

const ShowTile = ({ record }) => {
	// debugger
	const success_color = (success) => {
		let success_color;
		if (success === 'Good') {
			success_color = `is-success`;
		} else if (success === 'Bad') {
			success_color = `is-light`;
		}
		return success_color;
	};

	return (
		<div className="tile is-ancestor m-md">
			<div className="tile is-vertical m-md is-fullwidth">
				<div className="tile">
					<div className="tile is is-parent">
						<article
							className={`tile title is-child notification is-fullwidth ${success_color(record.success)} has-text-dark`}
						>
							<div className="box desktop-m-t-md is-fullwidth">
								<p className="has-text-centered center">{record.name}</p>
							</div>
						</article>
						<div className="tile is-white is-2 is-child is-vcentered is-centered p-sm">
							<div className="desktop-m-sm p-md">
								<Link to="/records/react" className="button is-fullwidth is-dark p-sm is-medium">
									Return to list
                </Link>
								</div>
								<div className="desktop-m-sm p-md">
									<a
										href={`/records/${record.id}/edit`}
										className="button is-fullwidth is-dark is-medium"
									>
										Edit Spot
									</a>
								</div>
							</div>
						</div>
					</div>
					<div className="tile is-verticle">
						<div className="tile is-vertical">
							<div className="tile">
								<div className="tile is-parent is-vertical">
									<article
										className={`tile is-child notification ${success_color(
											record.success
										)} has-text-centered`}
									>
										<div className="box">
											<p>
												{record.datetime}
											</p>
										</div>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>Species</td>
														<td>":record.species:"</td>
														<td></td>
													</tr>
													<tr>
														<td>Latitude</td>
														<td>{record.latitude}</td>
														<td>N</td>
													</tr>
													<tr>
														<td>Longitude</td>
														<td>{record.longitude}</td>
														<td>E</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
								</div>
								<div className="tile is-parent">
									<article className={`tile is-child notification ${success_color(record.success)} center`}>
										<figure className="image is-fullwidth">
											<img src="../app/assets/images/640x480.png"></img>
										</figure>
									</article>
								</div>
							</div>
							<div className="tile">
								<div className="tile is-parent">
									<article className={`tile is-child center notification ${success_color(record.success)}`}>
										<div className="box is-fullheight center">
											<h1>{record.body}</h1>
										</div>
									</article>
								</div>
							</div>
							<div className="tile">
								<div className="tile is-parent">
									<article className={`tile is-child notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>Moon Fraction</td>
														<td>":record.astro.moonFraction:"</td>
													</tr>
													<tr>
														<td>Moon Phase</td>
														<td>":record.astro.moonPhase:"</td>
													</tr>
													<tr>
														<td>Moonrise</td>
														<td>":record.astro.moonrise:"</td>
													</tr>
													<tr>
														<td>Moonset</td>
														<td>":record.astro.moonset:"</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
								</div>
								<div className="tile is-parent">
									<article className={`tile is-child notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>First Light</td>
														<td>":record.astro.astronomicalDawn:"</td>
													</tr>
													<tr>
														<td>Last Light</td>
														<td>":record.astro.astronomicalDusk:"</td>
													</tr>
													<tr>
														<td>Civil Dawn</td>
														<td>":record.astro.civilDawn:"</td>
													</tr>
													<tr>
														<td>Civil Dusk</td>
														<td>":record.astro.civilDusk:"</td>
													</tr>
													<tr>
														<td>Sunset</td>
														<td>":record.astro.sunset:"</td>
													</tr>
													<tr>
														<td>Sunrise</td>
														<td>":record.astro.sunrise:"</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
								</div>
							</div>
						</div>
						<div className="tile is-vertical is-4">
							<div className="tile ">
								<div className="tile is-parent is-vertical ">
									<article className={`tile is-child  notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>Air Temperature</td>
														<td>":record.weather.airTemperature:"</td>
													</tr>
													<tr>
														<td>Barometric Pressure</td>
														<td>":record.weather.pressure:"</td>
													</tr>
													<tr>
														<td>Cloud Cover</td>
														<td>":record.weather.cloudCover:"</td>
													</tr>
													<tr>
														<td>Visibility</td>
														<td>":record.weather.visibility:"</td>
													</tr>
													<tr>
														<td>Wind Gusts</td>
														<td>":record.weather.gust:"</td>
													</tr>
													<tr>
														<td>Wind Direction</td>
														<td>":record.weather.windDirection:"</td>
													</tr>
													<tr>
														<td>Wind Speed</td>
														<td>":record.weather.windSpeed:"</td>
													</tr>
													<tr>
														<td>Relative Humidity</td>
														<td>":record.weather.humidity:"</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
									<article className={`tile is-child notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>Wave Direction</td>
														<td></td>
													</tr>
													<tr>
														<td>Wave Height</td>
														<td></td>
													</tr>
													<tr>
														<td>Wave Period</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
									<article className={`tile is-child notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>Sea Level</td>
														<td>":record.weather.seaLevel:"</td>
													</tr>
													<tr>
														<td>Current Direction</td>
														<td>":record.weather.currentDirection:"</td>
													</tr>
													<tr>
														<td>Current Speed</td>
														<td>":record.weather.currentSpeed:"</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
									<article className={`tile is-child notification ${success_color(record.success)}`}>
										<div className="box center">
											<table className="table has-text-centered">
												<tbody>
													<tr>
														<td>":record.tide.first_type:"</td>
														<td>":record.tide.first_time:"</td>
													</tr>
													<tr>
														<td>":record.tide.second_type:"</td>
														<td>":record.tide.second_time:"</td>
													</tr>
													<tr>
														<td>":record.tide.third_type:"</td>
														<td>":record.tide.third_time:"</td>
													</tr>
													<tr>
														<td>":record.tide.fourth_type:"</td>
														<td>":record.tide.fourth_time:"</td>
													</tr>
												</tbody>
											</table>
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		);
	};
	
	export default ShowTile;
	