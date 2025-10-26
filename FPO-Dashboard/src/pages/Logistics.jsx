import { useState } from 'react'

export default function Logistics() {
  const [activeShipments] = useState([
    {
      id: 'SH001',
      orderId: 'ORD001',
      from: 'Ramesh Kumar Farm, Pune',
      to: 'Main Storage Facility, Pune',
      driver: 'Sunil Patil',
      vehicle: 'MH12AB1234',
      crop: 'Soybean',
      quantity: '500 kg',
      status: 'In Transit',
      progress: 75,
      estimatedArrival: '2:30 PM',
      phone: '+91 98765 43210'
    },
    {
      id: 'SH002',
      orderId: 'ORD002',
      from: 'Main Storage Facility, Pune',
      to: 'Adani Wilmar Ltd, Indore',
      driver: 'Rajesh Sharma',
      vehicle: 'MH14CD5678',
      crop: 'Mustard',
      quantity: '1000 kg',
      status: 'Loading',
      progress: 10,
      estimatedArrival: '6:00 PM',
      phone: '+91 98765 43211'
    },
    {
      id: 'SH003',
      orderId: 'ORD003',
      from: 'Priya Sharma Farm, Nagpur',
      to: 'Secondary Storage, Nagpur',
      driver: 'Amit Kumar',
      vehicle: 'MH31EF9012',
      crop: 'Groundnut',
      quantity: '300 kg',
      status: 'Delivered',
      progress: 100,
      estimatedArrival: 'Completed',
      phone: '+91 98765 43212'
    }
  ])

  const [selectedShipment, setSelectedShipment] = useState(activeShipments[0])

  const getStatusColor = (status) => {
    switch (status) {
      case 'Loading': return 'bg-yellow-100 text-yellow-800'
      case 'In Transit': return 'bg-blue-100 text-blue-800'
      case 'Delivered': return 'bg-green-100 text-green-800'
      case 'Delayed': return 'bg-red-100 text-red-800'
      default: return 'bg-gray-100 text-gray-800'
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Logistics Management</h1>
          <p className="text-gray-600">Track shipments and manage transportation</p>
        </div>
        <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors">
          + Schedule Pickup
        </button>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">🚛</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Active Shipments</p>
              <p className="text-2xl font-bold text-gray-900">12</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">✅</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Delivered Today</p>
              <p className="text-2xl font-bold text-gray-900">8</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-yellow-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">⏱️</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Avg Delivery Time</p>
              <p className="text-2xl font-bold text-gray-900">4.2h</p>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center">
            <div className="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center">
              <span className="text-2xl">⚠️</span>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-600">Delayed</p>
              <p className="text-2xl font-bold text-gray-900">2</p>
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Shipments List */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-lg font-semibold text-gray-900">Active Shipments</h2>
          </div>
          <div className="divide-y divide-gray-200">
            {activeShipments.map((shipment) => (
              <div
                key={shipment.id}
                className={`p-4 cursor-pointer hover:bg-gray-50 ${
                  selectedShipment.id === shipment.id ? 'bg-primary-50 border-l-4 border-primary-500' : ''
                }`}
                onClick={() => setSelectedShipment(shipment)}
              >
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center space-x-3">
                    <span className="font-medium text-gray-900">{shipment.id}</span>
                    <span className={`px-2 py-1 text-xs font-semibold rounded-full ${getStatusColor(shipment.status)}`}>
                      {shipment.status}
                    </span>
                  </div>
                  <span className="text-sm text-gray-500">{shipment.estimatedArrival}</span>
                </div>
                
                <div className="space-y-1 text-sm text-gray-600">
                  <p><strong>{shipment.crop}</strong> • {shipment.quantity}</p>
                  <p>📍 {shipment.from}</p>
                  <p>🎯 {shipment.to}</p>
                  <p>🚛 {shipment.driver} • {shipment.vehicle}</p>
                </div>

                {/* Progress Bar */}
                <div className="mt-3">
                  <div className="flex justify-between text-xs text-gray-600 mb-1">
                    <span>Progress</span>
                    <span>{shipment.progress}%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <div
                      className="bg-primary-500 h-2 rounded-full transition-all duration-300"
                      style={{ width: `${shipment.progress}%` }}
                    ></div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Shipment Details */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="px-6 py-4 border-b border-gray-200">
            <div className="flex items-center justify-between">
              <h2 className="text-lg font-semibold text-gray-900">Shipment Details</h2>
              <span className={`px-3 py-1 text-sm font-semibold rounded-full ${getStatusColor(selectedShipment.status)}`}>
                {selectedShipment.status}
              </span>
            </div>
          </div>

          <div className="p-6 space-y-6">
            {/* Route Information */}
            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Route Information</h3>
              <div className="space-y-3">
                <div className="flex items-start space-x-3">
                  <div className="w-3 h-3 bg-green-500 rounded-full mt-1"></div>
                  <div>
                    <p className="font-medium text-gray-900">Pickup Location</p>
                    <p className="text-sm text-gray-600">{selectedShipment.from}</p>
                  </div>
                </div>
                <div className="ml-1.5 border-l-2 border-gray-300 h-6"></div>
                <div className="flex items-start space-x-3">
                  <div className="w-3 h-3 bg-red-500 rounded-full mt-1"></div>
                  <div>
                    <p className="font-medium text-gray-900">Delivery Location</p>
                    <p className="text-sm text-gray-600">{selectedShipment.to}</p>
                  </div>
                </div>
              </div>
            </div>

            {/* Cargo Details */}
            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Cargo Details</h3>
              <div className="bg-gray-50 p-4 rounded-lg">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <p className="text-sm text-gray-600">Crop Type</p>
                    <p className="font-medium">{selectedShipment.crop}</p>
                  </div>
                  <div>
                    <p className="text-sm text-gray-600">Quantity</p>
                    <p className="font-medium">{selectedShipment.quantity}</p>
                  </div>
                  <div>
                    <p className="text-sm text-gray-600">Order ID</p>
                    <p className="font-medium">{selectedShipment.orderId}</p>
                  </div>
                  <div>
                    <p className="text-sm text-gray-600">ETA</p>
                    <p className="font-medium">{selectedShipment.estimatedArrival}</p>
                  </div>
                </div>
              </div>
            </div>

            {/* Driver Information */}
            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Driver Information</h3>
              <div className="flex items-center space-x-4">
                <div className="w-12 h-12 bg-primary-100 rounded-full flex items-center justify-center">
                  <span className="text-primary-600 font-semibold">
                    {selectedShipment.driver.split(' ').map(n => n[0]).join('')}
                  </span>
                </div>
                <div className="flex-1">
                  <p className="font-medium text-gray-900">{selectedShipment.driver}</p>
                  <p className="text-sm text-gray-600">Vehicle: {selectedShipment.vehicle}</p>
                  <p className="text-sm text-gray-600">Phone: {selectedShipment.phone}</p>
                </div>
                <button className="bg-primary-500 text-white px-3 py-1 rounded-lg text-sm hover:bg-primary-600 transition-colors">
                  Call Driver
                </button>
              </div>
            </div>

            {/* Actions */}
            <div className="flex space-x-3">
              <button className="flex-1 bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 transition-colors">
                Track Live
              </button>
              <button className="flex-1 border border-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-50 transition-colors">
                Update Status
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Map Placeholder */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Live Tracking Map</h2>
        <div className="bg-gray-100 rounded-lg h-64 flex items-center justify-center">
          <div className="text-center text-gray-500">
            <span className="text-4xl mb-2 block">🗺️</span>
            <p>Interactive map showing real-time vehicle locations</p>
            <p className="text-sm">Integration with Google Maps / Mapbox</p>
          </div>
        </div>
      </div>
    </div>
  )
}