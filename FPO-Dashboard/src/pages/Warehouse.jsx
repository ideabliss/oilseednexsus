import { useState } from 'react'

export default function Warehouse() {
  const [warehouses] = useState([
    {
      id: 'WH001',
      name: 'Main Storage Facility',
      location: 'Pune, Maharashtra',
      totalCapacity: 1000,
      currentStock: 850,
      temperature: '22°C',
      humidity: '45%',
      status: 'Active',
      crops: [
        { name: 'Soybean', quantity: 400, unit: 'tons' },
        { name: 'Mustard', quantity: 250, unit: 'tons' },
        { name: 'Groundnut', quantity: 200, unit: 'tons' }
      ]
    },
    {
      id: 'WH002',
      name: 'Secondary Storage',
      location: 'Nagpur, Maharashtra',
      totalCapacity: 500,
      currentStock: 320,
      temperature: '21°C',
      humidity: '42%',
      status: 'Active',
      crops: [
        { name: 'Sesame', quantity: 150, unit: 'tons' },
        { name: 'Sunflower', quantity: 170, unit: 'tons' }
      ]
    }
  ])

  const [selectedWarehouse, setSelectedWarehouse] = useState(warehouses[0])

  const getCapacityPercentage = (current, total) => {
    return Math.round((current / total) * 100)
  }

  const getCapacityColor = (percentage) => {
    if (percentage >= 90) return 'bg-red-500'
    if (percentage >= 70) return 'bg-yellow-500'
    return 'bg-green-500'
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Warehouse Management</h1>
          <p className="text-gray-600">Monitor storage facilities and inventory levels</p>
        </div>
        <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors">
          + Add Warehouse
        </button>
      </div>

      {/* Warehouse Overview Cards */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {warehouses.map((warehouse) => {
          const capacityPercentage = getCapacityPercentage(warehouse.currentStock, warehouse.totalCapacity)
          return (
            <div
              key={warehouse.id}
              className={`bg-white p-6 rounded-lg shadow-sm border-2 cursor-pointer transition-colors ${
                selectedWarehouse.id === warehouse.id
                  ? 'border-primary-500 bg-primary-50'
                  : 'border-gray-200 hover:border-gray-300'
              }`}
              onClick={() => setSelectedWarehouse(warehouse)}
            >
              <div className="flex items-center justify-between mb-4">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900">{warehouse.name}</h3>
                  <p className="text-sm text-gray-600">📍 {warehouse.location}</p>
                </div>
                <span className={`px-2 py-1 text-xs font-semibold rounded-full ${
                  warehouse.status === 'Active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                }`}>
                  {warehouse.status}
                </span>
              </div>

              {/* Capacity Bar */}
              <div className="mb-4">
                <div className="flex justify-between text-sm text-gray-600 mb-1">
                  <span>Capacity</span>
                  <span>{warehouse.currentStock}/{warehouse.totalCapacity} tons ({capacityPercentage}%)</span>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2">
                  <div
                    className={`h-2 rounded-full ${getCapacityColor(capacityPercentage)}`}
                    style={{ width: `${capacityPercentage}%` }}
                  ></div>
                </div>
              </div>

              {/* Environmental Conditions */}
              <div className="grid grid-cols-2 gap-4">
                <div className="text-center p-3 bg-blue-50 rounded-lg">
                  <p className="text-xs text-gray-600">Temperature</p>
                  <p className="text-lg font-semibold text-blue-600">{warehouse.temperature}</p>
                </div>
                <div className="text-center p-3 bg-green-50 rounded-lg">
                  <p className="text-xs text-gray-600">Humidity</p>
                  <p className="text-lg font-semibold text-green-600">{warehouse.humidity}</p>
                </div>
              </div>
            </div>
          )
        })}
      </div>

      {/* Detailed View */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200">
        <div className="px-6 py-4 border-b border-gray-200">
          <h2 className="text-lg font-semibold text-gray-900">
            {selectedWarehouse.name} - Inventory Details
          </h2>
        </div>

        <div className="p-6">
          {/* Crop Inventory */}
          <div className="mb-6">
            <h3 className="text-md font-semibold text-gray-900 mb-4">Current Inventory</h3>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {selectedWarehouse.crops.map((crop, index) => (
                <div key={index} className="bg-gray-50 p-4 rounded-lg">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="font-medium text-gray-900">{crop.name}</p>
                      <p className="text-2xl font-bold text-primary-600">{crop.quantity}</p>
                      <p className="text-sm text-gray-600">{crop.unit}</p>
                    </div>
                    <div className="w-12 h-12 bg-primary-100 rounded-full flex items-center justify-center">
                      <span className="text-2xl">🌾</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Recent Activities */}
          <div>
            <h3 className="text-md font-semibold text-gray-900 mb-4">Recent Activities</h3>
            <div className="space-y-3">
              <div className="flex items-center space-x-3 p-3 bg-green-50 rounded-lg">
                <span className="text-green-600">📥</span>
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-900">Incoming: 50 tons Soybean</p>
                  <p className="text-xs text-gray-600">From Ramesh Kumar • Expected: Today 3:00 PM</p>
                </div>
                <span className="text-xs text-gray-500">2 hours ago</span>
              </div>

              <div className="flex items-center space-x-3 p-3 bg-blue-50 rounded-lg">
                <span className="text-blue-600">📤</span>
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-900">Outgoing: 30 tons Mustard</p>
                  <p className="text-xs text-gray-600">To Adani Wilmar Ltd • Dispatched</p>
                </div>
                <span className="text-xs text-gray-500">5 hours ago</span>
              </div>

              <div className="flex items-center space-x-3 p-3 bg-yellow-50 rounded-lg">
                <span className="text-yellow-600">⚠️</span>
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-900">Quality Check Required</p>
                  <p className="text-xs text-gray-600">Batch #GN2024001 • Groundnut</p>
                </div>
                <span className="text-xs text-gray-500">1 day ago</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <button className="bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors">
          <div className="text-center">
            <span className="text-2xl mb-2 block">📥</span>
            <p className="text-sm font-medium text-gray-900">Record Intake</p>
          </div>
        </button>

        <button className="bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors">
          <div className="text-center">
            <span className="text-2xl mb-2 block">📤</span>
            <p className="text-sm font-medium text-gray-900">Process Dispatch</p>
          </div>
        </button>

        <button className="bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors">
          <div className="text-center">
            <span className="text-2xl mb-2 block">🔍</span>
            <p className="text-sm font-medium text-gray-900">Quality Check</p>
          </div>
        </button>

        <button className="bg-white p-4 rounded-lg shadow-sm border border-gray-200 hover:bg-gray-50 transition-colors">
          <div className="text-center">
            <span className="text-2xl mb-2 block">📊</span>
            <p className="text-sm font-medium text-gray-900">Generate Report</p>
          </div>
        </button>
      </div>
    </div>
  )
}