import { useState } from 'react'

export default function Profile() {
  const [activeTab, setActiveTab] = useState('profile')
  const [fpoData, setFpoData] = useState({
    name: 'Maharashtra Farmers Producer Organization',
    registrationNumber: 'FPO/MH/2020/001234',
    establishedYear: '2020',
    location: 'Pune, Maharashtra',
    contactPerson: 'Rajesh Sharma',
    phone: '+91 98765 43210',
    email: 'contact@maharashtrafpo.org',
    website: 'www.maharashtrafpo.org',
    totalMembers: 1247,
    activeMembers: 1180,
    totalLand: '5,240 acres',
    verificationStatus: 'Verified'
  })

  const [warehouses] = useState([
    {
      id: 'WH001',
      name: 'Main Storage Facility',
      location: 'Pune, Maharashtra',
      capacity: '1000 tons',
      currentStock: '850 tons',
      status: 'Active'
    },
    {
      id: 'WH002',
      name: 'Secondary Storage',
      location: 'Nagpur, Maharashtra',
      capacity: '500 tons',
      currentStock: '320 tons',
      status: 'Active'
    }
  ])

  const [certifications] = useState([
    { name: 'Organic Certification', issuer: 'NPOP', validUntil: '2025-03-15', status: 'Valid' },
    { name: 'FSSAI License', issuer: 'FSSAI', validUntil: '2024-12-31', status: 'Valid' },
    { name: 'ISO 9001:2015', issuer: 'BIS', validUntil: '2025-06-20', status: 'Valid' }
  ])

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-white rounded-lg p-6 shadow-lg border border-gray-200">
        <div className="flex items-center space-x-4">
          <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center">
            <span className="text-gray-900 font-bold text-2xl">MH</span>
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">{fpoData.name}</h1>
            <p className="text-gray-600">Registration: {fpoData.registrationNumber}</p>
            <div className="flex items-center space-x-2 mt-2">
              <span className="bg-green-500 text-white px-2 py-1 rounded-full text-xs font-semibold">
                ✓ {fpoData.verificationStatus}
              </span>
              <span className="text-gray-500 text-sm">Established {fpoData.establishedYear}</span>
            </div>
          </div>
        </div>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200">
        <nav className="-mb-px flex space-x-8">
          <button
            onClick={() => setActiveTab('profile')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'profile'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            FPO Profile
          </button>
          <button
            onClick={() => setActiveTab('warehouses')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'warehouses'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Warehouses
          </button>
          <button
            onClick={() => setActiveTab('certifications')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'certifications'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Certifications
          </button>
          <button
            onClick={() => setActiveTab('settings')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'settings'
                ? 'border-primary-500 text-primary-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            Settings
          </button>
        </nav>
      </div>

      {/* Profile Tab */}
      {activeTab === 'profile' && (
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Basic Information</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">FPO Name</label>
                <input
                  type="text"
                  value={fpoData.name}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  readOnly
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Registration Number</label>
                <input
                  type="text"
                  value={fpoData.registrationNumber}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  readOnly
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Location</label>
                <input
                  type="text"
                  value={fpoData.location}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Contact Person</label>
                <input
                  type="text"
                  value={fpoData.contactPerson}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Contact Information</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                <input
                  type="tel"
                  value={fpoData.phone}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <input
                  type="email"
                  value={fpoData.email}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Website</label>
                <input
                  type="url"
                  value={fpoData.website}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Membership Statistics</h2>
            <div className="grid grid-cols-2 gap-4">
              <div className="text-center p-4 bg-blue-50 rounded-lg">
                <p className="text-2xl font-bold text-blue-600">{fpoData.totalMembers}</p>
                <p className="text-sm text-gray-600">Total Members</p>
              </div>
              <div className="text-center p-4 bg-green-50 rounded-lg">
                <p className="text-2xl font-bold text-green-600">{fpoData.activeMembers}</p>
                <p className="text-sm text-gray-600">Active Members</p>
              </div>
              <div className="text-center p-4 bg-yellow-50 rounded-lg col-span-2">
                <p className="text-2xl font-bold text-yellow-600">{fpoData.totalLand}</p>
                <p className="text-sm text-gray-600">Total Farmland</p>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
            <h2 className="text-lg font-semibold text-gray-900 mb-4">Actions</h2>
            <div className="space-y-3">
              <button className="w-full bg-primary-500 text-white py-2 px-4 rounded-lg hover:bg-primary-600 transition-colors">
                Update Profile
              </button>
              <button className="w-full border border-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-50 transition-colors">
                Download Certificate
              </button>
              <button className="w-full border border-gray-300 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-50 transition-colors">
                Generate Report
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Warehouses Tab */}
      {activeTab === 'warehouses' && (
        <div className="space-y-4">
          {warehouses.map((warehouse) => (
            <div key={warehouse.id} className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              <div className="flex items-center justify-between mb-4">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900">{warehouse.name}</h3>
                  <p className="text-gray-600">📍 {warehouse.location}</p>
                </div>
                <span className={`px-3 py-1 text-sm font-semibold rounded-full ${
                  warehouse.status === 'Active' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                }`}>
                  {warehouse.status}
                </span>
              </div>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <p className="text-sm text-gray-600">Total Capacity</p>
                  <p className="font-semibold">{warehouse.capacity}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Current Stock</p>
                  <p className="font-semibold">{warehouse.currentStock}</p>
                </div>
                <div>
                  <p className="text-sm text-gray-600">Utilization</p>
                  <p className="font-semibold">85%</p>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Certifications Tab */}
      {activeTab === 'certifications' && (
        <div className="space-y-4">
          {certifications.map((cert, index) => (
            <div key={index} className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900">{cert.name}</h3>
                  <p className="text-gray-600">Issued by: {cert.issuer}</p>
                  <p className="text-sm text-gray-500">Valid until: {cert.validUntil}</p>
                </div>
                <div className="text-right">
                  <span className={`px-3 py-1 text-sm font-semibold rounded-full ${
                    cert.status === 'Valid' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                  }`}>
                    {cert.status}
                  </span>
                  <div className="mt-2">
                    <button className="text-primary-600 hover:text-primary-700 text-sm">
                      Download Certificate
                    </button>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Settings Tab */}
      {activeTab === 'settings' && (
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-6">Account Settings</h2>
          <div className="space-y-6">
            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Notifications</h3>
              <div className="space-y-3">
                <label className="flex items-center">
                  <input type="checkbox" className="rounded border-gray-300 text-primary-600 focus:ring-primary-500" defaultChecked />
                  <span className="ml-2 text-sm text-gray-700">Email notifications for new orders</span>
                </label>
                <label className="flex items-center">
                  <input type="checkbox" className="rounded border-gray-300 text-primary-600 focus:ring-primary-500" defaultChecked />
                  <span className="ml-2 text-sm text-gray-700">SMS alerts for urgent updates</span>
                </label>
                <label className="flex items-center">
                  <input type="checkbox" className="rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
                  <span className="ml-2 text-sm text-gray-700">Weekly performance reports</span>
                </label>
              </div>
            </div>

            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Security</h3>
              <div className="space-y-3">
                <button className="text-primary-600 hover:text-primary-700 text-sm">
                  Change Password
                </button>
                <br />
                <button className="text-primary-600 hover:text-primary-700 text-sm">
                  Enable Two-Factor Authentication
                </button>
              </div>
            </div>

            <div>
              <h3 className="text-md font-semibold text-gray-900 mb-3">Data & Privacy</h3>
              <div className="space-y-3">
                <button className="text-primary-600 hover:text-primary-700 text-sm">
                  Download My Data
                </button>
                <br />
                <button className="text-red-600 hover:text-red-700 text-sm">
                  Delete Account
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}