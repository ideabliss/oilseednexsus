import { useState } from 'react'

export default function ProductionMap() {
  const [selectedState, setSelectedState] = useState(null)
  const [mapView, setMapView] = useState('production')

  const stateData = [
    { name: 'Maharashtra', production: 8.5, area: 4.2, fpos: 145, status: 'amber', districts: 36 },
    { name: 'Madhya Pradesh', production: 7.2, area: 3.8, fpos: 132, status: 'green', districts: 52 },
    { name: 'Rajasthan', production: 6.8, area: 3.5, fpos: 98, status: 'green', districts: 33 },
    { name: 'Gujarat', production: 4.2, area: 2.1, fpos: 87, status: 'red', districts: 26 },
    { name: 'Karnataka', production: 3.9, area: 2.0, fpos: 76, status: 'amber', districts: 30 },
    { name: 'Andhra Pradesh', production: 3.2, area: 1.8, fpos: 65, status: 'green', districts: 13 },
    { name: 'Telangana', production: 2.8, area: 1.5, fpos: 54, status: 'green', districts: 10 },
    { name: 'Haryana', production: 2.1, area: 1.2, fpos: 43, status: 'amber', districts: 22 }
  ]

  const infrastructureData = [
    { type: 'Seed Hubs', operational: 245, planned: 350, utilization: 78 },
    { type: 'Storage Units', operational: 1240, planned: 1800, utilization: 85 },
    { type: 'Processing Centers', operational: 156, planned: 220, utilization: 71 },
    { type: 'Quality Labs', operational: 89, planned: 120, utilization: 82 }
  ]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-green-600 to-blue-600 rounded-2xl p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">Interactive Production Map</h1>
        <p className="text-white/90">State and district-wise oilseed production insights</p>
      </div>

      {/* Map Controls */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-bold text-gray-900">Map View Controls</h2>
          <div className="flex space-x-2">
            {['production', 'area', 'fpos', 'infrastructure'].map((view) => (
              <button
                key={view}
                onClick={() => setMapView(view)}
                className={`px-4 py-2 rounded-xl font-semibold transition-all duration-300 ${
                  mapView === view
                    ? 'bg-gradient-to-r from-blue-500 to-green-500 text-white shadow-lg'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {view.charAt(0).toUpperCase() + view.slice(1)}
              </button>
            ))}
          </div>
        </div>

        {/* Map Placeholder */}
        <div className="bg-gradient-to-br from-blue-50 to-green-50 rounded-2xl p-8 border-2 border-dashed border-gray-300 text-center">
          <div className="text-6xl mb-4">🗺️</div>
          <h3 className="text-2xl font-bold text-gray-700 mb-2">Interactive India Map</h3>
          <p className="text-gray-600 mb-4">Click on states to view detailed district-level data</p>
          <div className="flex justify-center space-x-4">
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-green-500 rounded-full"></div>
              <span className="text-sm text-gray-600">On Track</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-yellow-500 rounded-full"></div>
              <span className="text-sm text-gray-600">Monitor</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-4 h-4 bg-red-500 rounded-full"></div>
              <span className="text-sm text-gray-600">Behind Target</span>
            </div>
          </div>
        </div>
      </div>

      {/* State Data Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {stateData.map((state, index) => (
          <div 
            key={index} 
            className={`bg-white rounded-2xl shadow-lg p-6 border-2 cursor-pointer transition-all duration-300 hover:shadow-xl hover:scale-105 ${
              state.status === 'green' ? 'border-green-200 hover:border-green-400' :
              state.status === 'amber' ? 'border-yellow-200 hover:border-yellow-400' :
              'border-red-200 hover:border-red-400'
            }`}
            onClick={() => setSelectedState(state)}
          >
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-gray-900">{state.name}</h3>
              <div className={`w-4 h-4 rounded-full ${
                state.status === 'green' ? 'bg-green-500' :
                state.status === 'amber' ? 'bg-yellow-500' :
                'bg-red-500'
              }`}></div>
            </div>
            
            <div className="space-y-3">
              <div className="flex justify-between">
                <span className="text-sm text-gray-600">Production:</span>
                <span className="text-sm font-bold text-gray-900">{state.production} MT</span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm text-gray-600">Area:</span>
                <span className="text-sm font-bold text-gray-900">{state.area} M Ha</span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm text-gray-600">FPOs:</span>
                <span className="text-sm font-bold text-gray-900">{state.fpos}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-sm text-gray-600">Districts:</span>
                <span className="text-sm font-bold text-gray-900">{state.districts}</span>
              </div>
            </div>

            <button className="w-full mt-4 bg-gradient-to-r from-blue-500 to-green-500 text-white py-2 px-4 rounded-xl hover:from-blue-600 hover:to-green-600 transition-all duration-300 font-semibold">
              View Districts
            </button>
          </div>
        ))}
      </div>

      {/* Infrastructure Overview */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
          <span className="mr-3">🏗️</span>
          Infrastructure Development
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {infrastructureData.map((infra, index) => (
            <div key={index} className="bg-gradient-to-br from-gray-50 to-blue-50 rounded-2xl p-6 border border-gray-200">
              <h3 className="text-lg font-bold text-gray-900 mb-4">{infra.type}</h3>
              <div className="space-y-3">
                <div className="flex justify-between">
                  <span className="text-sm text-gray-600">Operational:</span>
                  <span className="text-sm font-bold text-green-600">{infra.operational}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-sm text-gray-600">Planned:</span>
                  <span className="text-sm font-bold text-blue-600">{infra.planned}</span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2">
                  <div 
                    className="h-2 rounded-full bg-gradient-to-r from-green-500 to-blue-500"
                    style={{ width: `${(infra.operational / infra.planned) * 100}%` }}
                  ></div>
                </div>
                <p className="text-sm text-gray-600">
                  {Math.round((infra.operational / infra.planned) * 100)}% Complete
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Selected State Details Modal */}
      {selectedState && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-8 max-w-2xl w-full mx-4 shadow-2xl">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-2xl font-bold text-gray-900">{selectedState.name} Details</h2>
              <button 
                onClick={() => setSelectedState(null)}
                className="text-gray-500 hover:text-gray-700 text-2xl"
              >
                ✕
              </button>
            </div>
            
            <div className="grid grid-cols-2 gap-6">
              <div className="space-y-4">
                <div className="bg-blue-50 rounded-xl p-4">
                  <h3 className="font-semibold text-blue-900">Production Metrics</h3>
                  <p className="text-2xl font-bold text-blue-600">{selectedState.production} MT</p>
                  <p className="text-sm text-blue-700">Current Production</p>
                </div>
                <div className="bg-green-50 rounded-xl p-4">
                  <h3 className="font-semibold text-green-900">Area Coverage</h3>
                  <p className="text-2xl font-bold text-green-600">{selectedState.area} M Ha</p>
                  <p className="text-sm text-green-700">Under Cultivation</p>
                </div>
              </div>
              
              <div className="space-y-4">
                <div className="bg-purple-50 rounded-xl p-4">
                  <h3 className="font-semibold text-purple-900">FPO Network</h3>
                  <p className="text-2xl font-bold text-purple-600">{selectedState.fpos}</p>
                  <p className="text-sm text-purple-700">Active FPOs</p>
                </div>
                <div className="bg-orange-50 rounded-xl p-4">
                  <h3 className="font-semibold text-orange-900">District Coverage</h3>
                  <p className="text-2xl font-bold text-orange-600">{selectedState.districts}</p>
                  <p className="text-sm text-orange-700">Total Districts</p>
                </div>
              </div>
            </div>
            
            <div className="mt-6 flex space-x-4">
              <button className="flex-1 bg-gradient-to-r from-blue-500 to-green-500 text-white py-3 px-6 rounded-xl hover:from-blue-600 hover:to-green-600 transition-all duration-300 font-semibold">
                View District Details
              </button>
              <button className="flex-1 bg-gray-100 text-gray-700 py-3 px-6 rounded-xl hover:bg-gray-200 transition-all duration-300 font-semibold">
                Download Report
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}