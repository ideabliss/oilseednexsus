import { useState } from 'react'

export default function Procurement() {
  const [activeTab, setActiveTab] = useState('available')
  const [selectedCrop, setSelectedCrop] = useState('all')

  const availableCrops = [
    {
      id: 1,
      farmer: 'Ramesh Kumar',
      location: 'Pune, Maharashtra',
      crop: 'Soybean',
      quantity: '500 kg',
      quality: 'Grade A',
      expectedPrice: '₹55/kg',
      harvestDate: '2024-01-15',
      phone: '+91 98765 43210',
      verified: true
    },
    {
      id: 2,
      farmer: 'Priya Sharma',
      location: 'Nagpur, Maharashtra',
      crop: 'Mustard',
      quantity: '300 kg',
      quality: 'Grade A',
      expectedPrice: '₹62/kg',
      harvestDate: '2024-01-20',
      phone: '+91 98765 43211',
      verified: true
    },
    {
      id: 3,
      farmer: 'Suresh Patil',
      location: 'Aurangabad, Maharashtra',
      crop: 'Groundnut',
      quantity: '200 kg',
      quality: 'Grade B',
      expectedPrice: '₹65/kg',
      harvestDate: '2024-01-18',
      phone: '+91 98765 43212',
      verified: false
    }
  ]

  const myOrders = [
    {
      id: 'ORD001',
      farmer: 'Ramesh Kumar',
      crop: 'Soybean',
      quantity: '500 kg',
      agreedPrice: '₹54/kg',
      totalAmount: '₹27,000',
      status: 'Pending Pickup',
      orderDate: '2024-01-10'
    },
    {
      id: 'ORD002',
      farmer: 'Anjali Desai',
      crop: 'Mustard',
      quantity: '400 kg',
      agreedPrice: '₹60/kg',
      totalAmount: '₹24,000',
      status: 'In Transit',
      orderDate: '2024-01-08'
    }
  ]

  const handleSendOffer = (cropId, offerPrice) => {
    console.log(`Sending offer of ${offerPrice} for crop ${cropId}`)
    // Implement offer logic
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Procurement Management</h1>
          <p className="text-gray-600">Connect with farmers and manage crop purchases</p>
        </div>
        <button className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors">
          + Add Manual Order
        </button>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200">
        <nav className="-mb-px flex space-x-8">
          <button
            onClick={() => setActiveTab('available')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'available'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Available Crops ({availableCrops.length})
          </button>
          <button
            onClick={() => setActiveTab('orders')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'orders'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            My Orders ({myOrders.length})
          </button>
        </nav>
      </div>

      {/* Filters */}
      <div className="bg-white p-4 rounded-lg shadow-sm border border-gray-200">
        <div className="flex flex-wrap gap-4">
          <select
            value={selectedCrop}
            onChange={(e) => setSelectedCrop(e.target.value)}
            className="border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
          >
            <option value="all">All Crops</option>
            <option value="soybean">Soybean</option>
            <option value="mustard">Mustard</option>
            <option value="groundnut">Groundnut</option>
            <option value="sesame">Sesame</option>
          </select>
          
          <select className="border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent">
            <option>All Locations</option>
            <option>Pune</option>
            <option>Nagpur</option>
            <option>Aurangabad</option>
          </select>

          <select className="border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent">
            <option>All Quality</option>
            <option>Grade A</option>
            <option>Grade B</option>
            <option>Grade C</option>
          </select>

          <button className="bg-gray-100 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-200 transition-colors">
            🔍 Search
          </button>
        </div>
      </div>

      {/* Content */}
      {activeTab === 'available' && (
        <div className="grid gap-6">
          {availableCrops.map((crop) => (
            <div key={crop.id} className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className="flex items-center space-x-3 mb-3">
                    <h3 className="text-lg font-semibold text-gray-900">{crop.farmer}</h3>
                    {crop.verified && (
                      <span className="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                        ✓ Verified
                      </span>
                    )}
                  </div>
                  
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                    <div>
                      <p className="text-sm text-gray-500">Crop</p>
                      <p className="font-medium">{crop.crop}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500">Quantity</p>
                      <p className="font-medium">{crop.quantity}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500">Quality</p>
                      <p className="font-medium">{crop.quality}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500">Expected Price</p>
                      <p className="font-medium text-primary-600">{crop.expectedPrice}</p>
                    </div>
                  </div>

                  <div className="flex items-center space-x-4 text-sm text-gray-600">
                    <span>📍 {crop.location}</span>
                    <span>📅 Harvest: {crop.harvestDate}</span>
                    <span>📞 {crop.phone}</span>
                  </div>
                </div>

                <div className="flex flex-col space-y-2 ml-6">
                  <button
                    onClick={() => handleSendOffer(crop.id, crop.expectedPrice)}
                    className="bg-primary-500 text-white px-4 py-2 rounded-lg hover:bg-primary-600 transition-colors"
                  >
                    Send Offer
                  </button>
                  <button className="border border-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-50 transition-colors">
                    View Details
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {activeTab === 'orders' && (
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order ID</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Farmer</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Crop</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {myOrders.map((order) => (
                  <tr key={order.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{order.id}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{order.farmer}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{order.crop}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{order.quantity}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{order.agreedPrice}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{order.totalAmount}</td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`inline-flex px-2 py-1 text-xs font-semibold rounded-full ${
                        order.status === 'In Transit' ? 'bg-blue-100 text-blue-800' :
                        order.status === 'Pending Pickup' ? 'bg-yellow-100 text-yellow-800' :
                        'bg-green-100 text-green-800'
                      }`}>
                        {order.status}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <button className="text-primary-600 hover:text-primary-900 mr-3">Track</button>
                      <button className="text-gray-600 hover:text-gray-900">Details</button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  )
}