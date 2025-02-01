// TextFormField(
//   controller: _sourceController,
//   onChanged: (value){
//     context.read<GetFlightBloc>().add(SourceChanged(source: value));
//   },
//   validator: (value) {
//     if (value!.isEmpty) {
//       return '*required';
//     }
//     return null;
//   },
//   decoration: InputDecoration(
//     prefixIcon: Icon(Icons.flight_takeoff_rounded),
//     labelText: "From",
//     labelStyle: TextStyle(
//         color: Colors.grey.shade700, fontSize: 18),
//     hintText: "Origin",
//     hintStyle: TextStyle(
//         color: Colors.grey.shade700, fontSize: 16),
//     enabledBorder: const UnderlineInputBorder(),
//     focusedBorder: const UnderlineInputBorder(
//         borderSide: BorderSide(
//             color: Colors.black, width: 2)),
//     contentPadding:
//     const EdgeInsets.only(top: 0, bottom: 0),
//   ),
// ),



// TextFormField(
//   controller: _destinationController,
//   onChanged: (value){
//     (context).read<GetFlightBloc>().add(DestinationChanged(destination: value));
//   },
//   validator: (value){
//     if (value!.isEmpty) {
//       return '*required';
//     }
//     return null;
//   },
//
// ),