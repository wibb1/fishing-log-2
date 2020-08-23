// import React from 'react';
// import { Link } from 'react-router-dom';

// const OtherRecordTile = ({ name, success }) => {
// 	const success_color = (success) => {
// 		let success_color;
// 		if (success === 'Good') {
// 			success_color = 'is-success';
// 		} else {
// 			success_color = 'is-light';
// 		}
// 		return success_color;
// 	};

// 	return (
// 		<div className="tile is-ancestor p-sm">
// 			<div className="tile is-vertical">
// 				<div className="tile is-parent">
// 					<Link to={`/records/react/${id}`}>
// 						<div className={`tile is-child notification ${success_color(success)}`}>
// 							<div className="box">
// 								<div className="columns">
// 									<div className="column">
// 										<p className="title is-size-3 is-size-4-touch">{name}</p>
// 									</div>
// 									<div className="column is-vcentered">
// 										<div className="subtitle is-size-3 is-size-4-touch">
// 											<p className="has-text-right">":date:" ":time:""</p>
// 										</div>
// 									</div>
// 								</div>
// 							</div>
// 						<div className="columns">
// 							<div className="column">
// 								<div className="box">
// 									<p className="subtitle is-size-4 is-5-touch has-text-weight-b">
// 										<strong className="">Whats on the menu:</strong> ":species:"
// 									</p>
// 								</div>
// 							</div>
// 							<hr />
// 						</div>
// 							<div className="box">
// 								<p className="is-6">":body:"</p>
// 							</div>
// 							<div className="columns">
// 								<div className="column m-2">
// 									<div className="box center">
// 										<table className="table has-text-centered center">
// 											<tbody>
// 												<tr>
// 													<th>Tide Time</th>
// 													<th>Tide Height(aMSL)</th>
// 												</tr>
// 												<tr>
// 													<td>":firstTime:"</td>
// 													<td>":firstType:" </td>
// 												</tr>
// 												<tr>
// 													<td>":secondTime:"</td>
// 													<td>":secondType:"</td>
// 												</tr>
// 												<tr>
// 													<td>":thirdTime:"</td>
// 													<td>":thirdType:"</td>
// 												</tr>
// 												<tr>
// 													<td>":fourthTime:"</td>
// 													<td>":fourthType:"</td>
// 												</tr>
// 											</tbody>
// 										</table>
// 									</div>
// 								</div>
// 								<div className="column">
// 									<div className="box center">
// 										<table className="table has-text-centered center">
// 											<tbody>
// 												<tr>
// 													<th>Measurement</th>
// 													<th>Units</th>
// 													<th>Value</th>
// 												</tr>
// 												<tr>
// 													<td>Pressure</td>
// 													<td>(in):</td>
// 													<td>":pressure:"</td>
// 												</tr>
// 												<tr>
// 													<td>Humidity</td>
// 													<td>(%):</td>
// 													<td>":humidity:"</td>
// 												</tr>
// 												<tr>
// 													<td>Wind Direction </td>
// 													<td>(degrees): </td>
// 													<td>":windDirection:"</td>
// 												</tr>
// 												<tr>
// 													<td>Wind Speed </td>
// 													<td>(mph): </td>
// 													<td>":windSpeed:"</td>
// 												</tr>
// 											</tbody>
// 										</table>
// 									</div>
// 								</div>
// 								<div className="column is-centered">
// 									<div className="box center">
// 										<table className="table has-text-centered center">
// 											<tbody>
// 												<tr>
// 													<th>Moon Info</th>
// 													<th>Value</th>
// 												</tr>
// 												<tr>
// 													<td>Moon Fraction</td>
// 													<td>":moonFraction:"</td>
// 												</tr>
// 												<tr>
// 													<td>Moon Phase</td>
// 													<td>":moonPhase:"</td>
// 												</tr>
// 												<tr>
// 													<td>Sunrise</td>
// 													<td>":sunrise:"</td>
// 												</tr>
// 												<tr>
// 													<td>Sunset</td>
// 													<td>":sunset:"</td>
// 												</tr>
// 											</tbody>
// 										</table>
// 									</div>
// 								</div>
// 							</div>
// 						</div>
// 					</Link>
// 				</div>
// 			</div>
// 		</div>
// 	);
// };

// export default ;
